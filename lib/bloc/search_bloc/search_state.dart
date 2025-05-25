part of 'search_bloc.dart';

abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoadedState extends SearchState {
  final SearchData data;

  SearchLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class SearchEmptyState extends SearchState {
  final SearchData data;

  SearchEmptyState(this.data);

  @override
  List<Object?> get props => [];
}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
