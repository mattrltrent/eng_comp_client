import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

import '../../core/results.dart';
import '../../core/services/http.dart';
import '../../di.dart';
import '../services/db.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoading());

  Future<void> logout() async {
    final res = await sl.get<DbService>().delete("token");
    if (res is Failure) {
      emit(CriticalAuthError(message: "Failed to delete token"));
    } else {
      emit(NotAuthenticated());
    }
  }

  Future<void> register(String username, String password, String displayName) async {
    try {
      (await sl.get<HttpService>().call(Verb.post, "/register", {},
              body: {"username": username, "password": password, "display_name": displayName},
              timeout: const Duration(seconds: 8)))
          .fold(
        (failure) => emit(AuthFailed(message: "Ill-formatted request")),
        (response) async {
          if (response.statusCode == 201) {
            String token = json.decode(response.body)["body"]["token"];
            final res = await sl.get<DbService>().write("token", token);
            if (res is Success) {
              emit(Authenticated(username: username, token: token));
            } else {
              emit(CriticalAuthError(message: "Failed to write token"));
            }
          } else {
            emit(AuthFailed(message: "Non-201 code"));
          }
        },
      );
    } catch (_) {
      emit(AuthFailed(message: "Parsing error"));
    }
  }

  Future<void> login(String username, String password) async {
    try {
      (await sl.get<HttpService>().call(Verb.post, "/login", {},
              body: {"username": username, "password": password}, timeout: const Duration(seconds: 8)))
          .fold(
        (failure) => emit(AuthFailed(message: "Ill-formatted request")),
        (response) async {
          if (response.statusCode == 200) {
            String token = json.decode(response.body)["body"]["token"];
            final res = await sl.get<DbService>().write("token", token);
            if (res is Success) {
              emit(Authenticated(username: username, token: token));
            } else {
              emit(CriticalAuthError(message: "Failed to write token"));
            }
          } else {
            emit(AuthFailed(message: "Non-200 code"));
          }
        },
      );
    } catch (err) {
      print("ERRROR++++>>: ${Left(err).runtimeType}");
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
        String username = JwtDecoder.decode(token)["username"];
        int expiry = JwtDecoder.decode(token)["exp"];
        if (expiry < DateTime.now().millisecondsSinceEpoch / 1000) {
          logout();
        } else {
          emit(Authenticated(username: username, token: token));
        }
      });
    } catch (_) {
      emit(CriticalAuthError(message: "Error reading username from jwt"));
    }
  }
}
