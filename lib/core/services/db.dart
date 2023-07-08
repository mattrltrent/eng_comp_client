import 'package:client/core/results.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dartz/dartz.dart';

class DbService {
  final FlutterSecureStorage storage;

  DbService(this.storage);

  Future<Either<Result, String>> read(String key) async {
    try {
      final res = await storage.read(key: key);
      if (res == null) return Left(Empty());
      return Right(res);
    } catch (_) {
      return Left(Failure());
    }
  }

  Future<Result> delete(String key) async {
    try {
      await storage.delete(key: key);
      return Success();
    } catch (_) {
      return Failure();
    }
  }

  Future<Result> write(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
      return Success();
    } catch (_) {
      return Failure();
    }
  }
}
