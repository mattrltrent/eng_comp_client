import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../config.dart';
import '../results.dart';

enum Verb { get, post, put, delete, patch }

class HttpService {
  static const urlPrefix = "https://";

  Future<Either<Failure, Response>> call(Verb verb, String endpoint, Map<String, String> headers,
      {dynamic body,
      Map<String, String> baseHeaders = const {"Content-Type": "application/json"},
      Duration timeout = const Duration(seconds: 5),
      String domain = domain}) async {
    try {
      String url = "$urlPrefix$domain$endpoint";
      headers.addAll(baseHeaders);
      late Response response;
      switch (verb) {
        case Verb.get:
          response = await http.get(Uri.parse(url), headers: headers).timeout(timeout);
          break;
        case Verb.post:
          response = await http.post(Uri.parse(url), headers: headers, body: json.encode(body)).timeout(timeout);
          break;
        case Verb.put:
          response = await http.put(Uri.parse(url), headers: headers, body: json.encode(body)).timeout(timeout);
          break;
        case Verb.delete:
          response = await http.delete(Uri.parse(url), headers: headers).timeout(timeout);
          break;
        case Verb.patch:
          response = await http.patch(Uri.parse(url), headers: headers, body: json.encode(body)).timeout(timeout);
          break;
        default:
          throw Exception("invalid verb");
      }
      return Right(response);
    } catch (err) {
      print("ERRRR: ${err.toString()}");
      throw Left(Failure(message: err.toString()));
    }
  }
}
