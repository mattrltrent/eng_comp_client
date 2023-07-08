import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'core/cubit/auth_cubit.dart';
import 'core/cubit/query_classes_cubit.dart';
import 'core/services/db.dart';
import 'core/services/http.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // ensure Flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  // cubits
  sl.registerFactory(() => SearchPrefsCubit());
  sl.registerFactory(() => AuthCubit());
  sl.registerLazySingleton(() => QueryClassesCubit());

  // services
  sl.registerLazySingleton(() => DbService(sl()));
  sl.registerLazySingleton(() => HttpService());

  // external
  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
