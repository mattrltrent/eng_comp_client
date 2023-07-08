import 'package:client/core/cubit/classes_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // ensure Flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  // register application states
  sl.registerFactory(() => ClassesCubit());
}
