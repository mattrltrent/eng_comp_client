import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../entities/class.dart';

part 'query_classes_state.dart';

class QueryClassesCubit extends Cubit<QueryClassesState> {
  QueryClassesCubit() : super(QueryClassesInitial());
}
