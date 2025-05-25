part of 'groups_cubit.dart';

@immutable
abstract class GroupsState {}

class GroupsInitial extends GroupsState {}

class GroupsLoaded extends GroupsState {
  GroupsLoaded({required this.data});
  final List<GroupModel> data;
}

class GroupsError extends GroupsState {}

class InitAddressState extends GroupsState {}
