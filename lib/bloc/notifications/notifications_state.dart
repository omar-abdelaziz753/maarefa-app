part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsProviderLoadedState extends NotificationsState {
  final NotificationProviderModel? data;
  NotificationsProviderLoadedState({this.data});
}

class NotificationsUserLoadedState extends NotificationsState {
  final NotificationUserModel data;
  NotificationsUserLoadedState({required this.data});
}

class NotificationsProviderErrorState extends NotificationsState {}

class NotificationsUserErrorState extends NotificationsState {}
