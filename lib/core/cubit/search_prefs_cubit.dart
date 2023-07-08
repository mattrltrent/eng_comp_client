import 'package:bloc/bloc.dart';
import 'package:client/core/entities/class.dart';
import 'package:meta/meta.dart';

part 'search_prefs_state.dart';

class SearchPrefsCubit extends Cubit<SearchPrefsState> {
  SearchPrefsCubit() : super(SearchPrefsInitial());

  void setLookingFor(LookingFor lookingFor) =>
      emit(SearchPrefsInitial(lookingFor: lookingFor, classes: (state as SearchPrefsInitial).classes));

  void removeAtIdx(int idx) => emit(SearchPrefsInitial(
      lookingFor: (state as SearchPrefsInitial).lookingFor,
      classes: (state as SearchPrefsInitial).classes..removeAt(idx)));
}
