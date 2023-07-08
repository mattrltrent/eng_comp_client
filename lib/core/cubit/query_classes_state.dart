part of 'query_classes_cubit.dart';

@immutable
abstract class QueryClassesState {}

class QueryClassesInitial extends QueryClassesState {}

class QueryClassesLoading extends QueryClassesState {}

class QueryClassesLoaded extends QueryClassesState {
  final List<Class> classes;

  QueryClassesLoaded(this.classes);
}

class QueryClassesError extends QueryClassesState {
  final String message;

  QueryClassesError(this.message);
}
