import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  var fakeSearchText = 'fake-search-text';
  var searchState = SearchState.initial();
  
  group('Search Bloc', () {
    blocTest(
     'Search Text Changed Test',
      build: () => SearchBloc(),
      act: (SearchBloc bloc) {
        bloc.add(SearchEvent.searchTextChanged(fakeSearchText));
      },
      expect: ()=>[
        searchState.copyWith(
          isSearchInProgress: true,
          searchText: fakeSearchText
        )
      ]
    );
    blocTest(
     'Search on Submit/Done clicked Test',
      build: () => SearchBloc(),
      act: (SearchBloc bloc) {
        bloc.add(SearchEvent.searchTextSubmitted(fakeSearchText));
      },
      expect: ()=>[
        searchState.copyWith(
          isSearchInProgress: true,
          searchText: fakeSearchText
        )
      ]
    );
    blocTest(
     'Clear Search Text Test',
      build: () => SearchBloc(),
      act: (SearchBloc bloc) {
        bloc.add(const SearchEvent.clearSearchText());
      },
      expect: ()=>[
        searchState.copyWith(
          isSearchInProgress: true,
          searchText: ''
        )
      ]
    );

    blocTest(
     'Reset Search InProgress True Test',
      build: () => SearchBloc(),
      act: (SearchBloc bloc) {
        bloc.add( const SearchEvent.resetSearchInProgress(true));
      },
      expect: ()=>[
        searchState.copyWith(
          isSearchInProgress: true,
        )
      ]
    );

     blocTest(
     'Reset Search InProgress False Test',
      build: () => SearchBloc(),
      act: (SearchBloc bloc) {
        bloc.add( const SearchEvent.resetSearchInProgress(false));
      },
      expect: ()=>[
        searchState.copyWith(
          isSearchInProgress: false,
        )
      ]
    );
  });
}
