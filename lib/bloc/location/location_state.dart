part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class GetLocationState extends LocationState {}

class SetMarkerState extends LocationState {}

class SetManualState extends LocationState {}

class SetAutoState extends LocationState {}

class GetAddressState extends LocationState {}

class GoToPlaceState extends LocationState {}

class BackToHomeState extends LocationState {}

class PermissionState extends LocationState {}

class SetUserAddressState extends LocationState {}
