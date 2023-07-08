import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../../core/results.dart';
import '../../core/services/http.dart';
import '../../di.dart';
import '../services/db.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // AuthCubit() : super(AuthLoading()); // TODO
  AuthCubit()
      : super(Authenticated(
            email: "some email",
            token:
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhhbG5fMDFAcHJvdG9uLm1lIiwicGFzc3dvcmQiOiJ0ZXN0IiwiaXNzIjoiRWR1QnVkZHkiLCJzdWIiOiJoYWxuXzAxQHByb3Rvbi5tZSIsImV4cCI6MTY4ODkyOTkwMCwibmJmIjoxNjg4ODQzNTAwLCJpYXQiOjE2ODg4NDM1MDB9.heS2BJP1i6TVjOBHzp2_li4ymlc6BUHhNBPlyGJeq_Y"));

  Future<void> logout() async {
    final res = await sl.get<DbService>().delete("token");
    if (res is Failure) {
      emit(CriticalAuthError(message: "Failed to delete token"));
    } else {
      emit(NotAuthenticated());
    }
  }

  Future<void> register(String email, String password) async {
    try {
      (await sl.get<HttpService>().call(
                Verb.post,
                "/auth",
                {},
                body: {"email": email, "password": password},
                timeout: const Duration(seconds: 8),
              ))
          .fold(
        (failure) => emit(AuthFailed(message: "Ill-formatted request")),
        (response) async {
          if (response.statusCode == 201) {
            String token = json.decode(response.body)["token"];
            final res = await sl.get<DbService>().write("token", token);
            if (res is Success) {
              emit(Authenticated(email: email, token: token));
            } else {
              emit(CriticalAuthError(message: "Failed to write token"));
            }
          } else {
            emit(AuthFailed(message: "Non-201 code (${response.statusCode})"));
          }
        },
      );
    } catch (e) {
      emit(AuthFailed(message: "Parsing error"));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      (await sl.get<HttpService>().call(Verb.post, "/signin", {},
              body: {"email": email, "password": password}, timeout: const Duration(seconds: 8)))
          .fold(
        (failure) => emit(AuthFailed(message: "Ill-formatted request")),
        (response) async {
          if (response.statusCode == 200) {
            String token = json.decode(response.body)["token"];
            final res = await sl.get<DbService>().write("token", token);
            if (res is Success) {
              emit(Authenticated(email: email, token: token));
            } else {
              emit(CriticalAuthError(message: "Failed to write token"));
            }
          } else {
            emit(AuthFailed(message: "Non-200 code (${response.statusCode})"));
          }
        },
      );
    } catch (err) {
      emit(AuthFailed(message: "Parsing error"));
    }
  }

  Future<void> silentAuth({bool artificialDelay = false}) async {
    if (artificialDelay) await Future.delayed(const Duration(milliseconds: 500));
    try {
      (await sl.get<DbService>().read("token")).fold((failureOrEmpty) {
        if (failureOrEmpty is Empty) {
          emit(NotAuthenticated());
        } else {
          emit(CriticalAuthError(message: "Error reading local db"));
        }
      }, (token) async {
        String email = JwtDecoder.decode(token)["email"];
        int expiry = JwtDecoder.decode(token)["exp"];
        if (expiry < DateTime.now().millisecondsSinceEpoch / 1000) {
          logout();
        } else {
          emit(Authenticated(email: email, token: token));
        }
      });
    } catch (_) {
      emit(CriticalAuthError(message: "Error reading username from jwt"));
    }
  }
}
