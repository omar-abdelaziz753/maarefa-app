part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}

class TextChanged extends SearchEvent {
  final String? text;

  const TextChanged({this.text});

  @override
  List<Object> get props => [text!];

  @override
  String toString() => 'TextChanged { text: $text }';
}
