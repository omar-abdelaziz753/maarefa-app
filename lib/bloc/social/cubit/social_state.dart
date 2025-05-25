// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'social_cubit.dart';

abstract class SocialState extends Equatable {
  const SocialState();

  @override
  List<Object> get props => [];
}

class SocialInitial extends SocialState {}

class SocialLoading extends SocialState {}

class SocialSuccess extends SocialState {
  final SocialResponse socialResponse;
  const SocialSuccess({
    required this.socialResponse,
  });
}

class SocialError extends SocialState {
  const SocialError({required this.message});
  final String message;
}
