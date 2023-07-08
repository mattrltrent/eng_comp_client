part of 'search_prefs_cubit.dart';

enum LookingFor { tutors, students, all }

String lookingForToString(LookingFor lookingFor) {
  switch (lookingFor) {
    case LookingFor.tutors:
      return "Looking for tutors";
    case LookingFor.students:
      return "Looking for students";
    case LookingFor.all:
      return "Checking everything out";
    default:
      return "all";
  }
}

@immutable
abstract class SearchPrefsState {}

class SearchPrefsInitial extends SearchPrefsState {
  final LookingFor lookingFor;
  final List<Class> classes;

  SearchPrefsInitial({this.lookingFor = LookingFor.all, List<Class>? classes})
      : classes =
            classes ?? [Class(name: "MATH", code: 291), Class(name: "MATH", code: 222), Class(name: "CSC", code: 226)];
}
