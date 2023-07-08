import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'classes_state.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit() : super(ClassesInitial());
}
