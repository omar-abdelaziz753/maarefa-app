part of 'user_cubit.dart';

abstract class UserState {
  // const UserState();
}

class UserInitial extends UserState {
  // const UserInitial();
}

class UserLoadedState extends UserState {
  final UserDbResponse? data;
  UserLoadedState({this.data});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserLoadedState && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class UserApiLoadedState extends UserState {
  final UserDbResponse? data;
  UserApiLoadedState({this.data});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserApiLoadedState && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class ErrorUserState extends UserState {
  final String message;
  ErrorUserState(this.message);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorUserState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class SameGenderState extends UserState {}

class ChangeGenderState extends UserState {}

class SelectGenderState extends UserState {}

class SameCityState extends UserState {}

class ChangeCityState extends UserState {}

class ChooseCityState extends UserState {}

class SameNationalityState extends UserState {}

class ChangeNationalityState extends UserState {}

class PickInitState extends UserState {}

class PickPictureState extends UserState {}

class ValidateEmptyState extends UserState {}

class ValidateNotEmptyState extends UserState {}

class ValidateState extends UserState {}

class EditProfileState extends UserState {}

class InitUserState extends UserState {}

class SameNationState extends UserState {}

class ChangeNationState extends UserState {}

class ChooseNationState extends UserState {}

class SelectBirthdateState extends UserState {}

class ValidateEmailState extends UserState {}

class EditEmailState extends UserState {}

class EditPasswordState extends UserState {}

class ChangeOldState extends UserState {}

class ChangePasswordState extends UserState {}

class ChangeConfirmState extends UserState {}
