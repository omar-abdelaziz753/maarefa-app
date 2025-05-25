import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/common/search/search_db_response.dart';
import '../../repository/common/search/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) async {
        if (event is TextChanged) {
          final String searchTerm = event.text!;
          emit(SearchLoadingState());
          try {
            final data = await searchRepository.getSearchedItems(searchTerm);
            emit(SearchLoadedState(data.data));
          } catch (e) {
            emit(SearchErrorState(e.toString()));
          }
        } else if (event is LoadSearchEvent) {
          emit(SearchLoadingState());
        } else {
          emit(SearchInitial());
        }
      },
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 500))
            .asyncExpand(mapper);
      },
    );
  }
}
