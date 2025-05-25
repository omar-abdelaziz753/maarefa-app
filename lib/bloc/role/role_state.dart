part of 'role_cubit.dart';

@immutable
abstract class RoleState {}

class RoleInitial extends RoleState {}

class UserRoleState extends RoleState {}

class ProviderRoleState extends RoleState {}
