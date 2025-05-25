part of 'live_share_link_cubit.dart';

abstract class LiveShareLinkState extends Equatable {
  const LiveShareLinkState();

  @override
  List<Object> get props => [];
}

class LiveShareLinkInitial extends LiveShareLinkState {}

class LiveShareLinkSuccessState extends LiveShareLinkState {
  final String link;

  const LiveShareLinkSuccessState({required this.link});

  @override
  List<Object> get props => [link];
}

class LiveShareLinkFailState extends LiveShareLinkState {}

class LiveShareLinkLoadingState extends LiveShareLinkState {}
