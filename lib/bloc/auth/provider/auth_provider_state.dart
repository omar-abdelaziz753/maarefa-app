part of 'auth_provider_cubit.dart';

abstract class AuthProviderState {}

class AuthProviderInitial extends AuthProviderState {}

class AuthInitial extends AuthProviderState {}

class ChangeAuthProviderState extends AuthProviderState {}

class ChangePasswordState extends AuthProviderState {}

class ChangeConfirmState extends AuthProviderState {}

class LoginState extends AuthProviderState {}

class RegisterState extends AuthProviderState {}

class ValidateEmptyState extends AuthProviderState {}

class ValidateNotEmptyState extends AuthProviderState {}

class ValidateState extends AuthProviderState {}

class ForgetState extends AuthProviderState {}

class RestoreState extends AuthProviderState {}

class CheckCodeState extends AuthProviderState {}

class ActivateState extends AuthProviderState {}

class ResendCodeState extends AuthProviderState {}

class LogoutState extends AuthProviderState {}

class ResetBottomBarState extends AuthProviderState {}

class SameGenderState extends AuthProviderState {}

class ChangeGenderState extends AuthProviderState {}

class SelectGenderState extends AuthProviderState {}

class SameCityState extends AuthProviderState {}

class ChangeCityState extends AuthProviderState {}

class ChooseCityState extends AuthProviderState {}

class AuthProviderLoadedState extends AuthProviderState {}

class AuthErrorState extends AuthProviderState {}

class AcceptTermsState extends AuthProviderState {}

class RejectTermsState extends AuthProviderState {}

class SameNationState extends AuthProviderState {}

class ChangeNationState extends AuthProviderState {}

class ChooseNationState extends AuthProviderState {}

class ValidateEmailState extends AuthProviderState {}

class ValidateBioState extends AuthProviderState {}

class PickInitState extends AuthProviderState {}

class PickCVState extends AuthProviderState {}

class ValidateGradesState extends AuthProviderState {}

class SameGradeState extends AuthProviderState {}

class NewGradeState extends AuthProviderState {}

class ChooseGradeState extends AuthProviderState {}

class InitGradeState extends AuthProviderState {}

class RegisterProviderState extends AuthProviderState {}

class VerifyProviderState extends AuthProviderState {}

class ChangeToArState extends AuthProviderState {}

class ChangeToEnState extends AuthProviderState {}

class CertificateLoadedState extends AuthProviderState {
  final CertificateData? data;
  CertificateLoadedState({this.data});
}

class CertificateErrorState extends AuthProviderState {}

class PickCertificateState extends AuthProviderState {}

class DeleteCertificateState extends AuthProviderState {}
