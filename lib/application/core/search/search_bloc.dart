import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<SearchEvent>(
      _onEvent,
      transformer: (events, mapper) {
        final nonDebounceStream = events
            .where((event) => event is! _SearchTextChanged)
            .switchMap(mapper);
        final nonDebounceStreamSearchProgress = events
            .where((event) => event is! _SearchTextChanged)
            .switchMap(mapper);
        final nonDebounceSubmittedStream = events
            .where((event) => event is _SearchTextSubmitted)
            .switchMap(mapper);
        final debounceStream = events
            .where((SearchEvent event) => event is _SearchTextChanged)
            .debounceTime((const Duration(seconds: 3)))
            .switchMap(mapper);
            

        return events.mergeWith([
          nonDebounceStream,
          nonDebounceStreamSearchProgress,
          nonDebounceSubmittedStream,
          debounceStream,
        ]);
      },
    );
  }

  Future<void> _onEvent(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    event.map(
      searchTextChanged: (e) {
        emit(
          state.copyWith(searchText: e.searchText, isSearchInProgress: true),
        );
      },
      searchTextSubmitted: (e) {
        emit(
          state.copyWith(searchText: e.searchText, isSearchInProgress: true),
        );
      },
      clearSearchText: (e) {
        emit(state.copyWith(searchText: '', isSearchInProgress: true));
      },
      resetSearchInProgress: (e) {
        emit(state.copyWith(isSearchInProgress: e.isSearchInProgress));
      },
    );
  }
}
