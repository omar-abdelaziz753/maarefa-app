part of 'provider_cubit.dart';

@immutable
abstract class ProviderState {
  // const ProviderState();
}

class ProviderInitial extends ProviderState {
  // const ProviderInitial();
}

class ProviderLoadedState extends ProviderState {
  final ProviderDbResponse? data;
  ProviderLoadedState({this.data});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProviderLoadedState && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class ErrorProviderState extends ProviderState {
  final String message;
  ErrorProviderState(this.message);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorProviderState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class SameGenderState extends ProviderState {}

class ChangeGenderState extends ProviderState {}

class SelectGenderState extends ProviderState {}

class SameCityState extends ProviderState {}

class ChangeCityState extends ProviderState {}

class ChooseCityState extends ProviderState {}

class PickInitState extends ProviderState {}

class PickPictureState extends ProviderState {}

class ValidateEmptyState extends ProviderState {}

class ValidateNotEmptyState extends ProviderState {}

class ValidateState extends ProviderState {}

class EditProfileState extends ProviderState {}

class InitProviderState extends ProviderState {}

class SameNationState extends ProviderState {}

class ChangeNationState extends ProviderState {}

class ChooseNationState extends ProviderState {}

class InitBioState extends ProviderState {}

class EditBioState extends ProviderState {}

class InitSpecializationState extends ProviderState {}

class EditSpecializationState extends ProviderState {}
