import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../service/local/share_prefs_service.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(BuildContext context) => BlocProvider.of(context);

  SharedPrefService prefService = SharedPrefService();

  LocationPermission? per;
  final Completer<GoogleMapController> mapController = Completer();
  final Set<Marker> markers = <Marker>{};
  double? lat;
  double? lng;
  var address = '';

  /// current Location
  void getLocation() async {
    try {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied ||
          per == LocationPermission.deniedForever) {
        // await Geolocator.requestPermission();
        await requestPermission();
      } else {
       final Position currentLoc = await Geolocator.getCurrentPosition(
            // desiredAccuracy: LocationAccuracy.best,
            );

        lat = currentLoc.latitude;
        lng = currentLoc.longitude;
        await backToHome(lat, lng);
        await getAddress(lat!, lng!);
        emit(GetLocationState());
      }
    } catch (e) {
      await backToHome(lat ?? 30.044256, lng ?? 30.044256);
      await getAddress(lat ?? 30.044256, lng ?? 30.044256);
    }
  }

  requestPermission() async {
    await Geolocator.requestPermission();
    getLocation();
    emit(PermissionState());
  }

  /// Set Marker
  void setMarker(LatLng point) {
    markers.add(
      Marker(
        markerId: const MarkerId('marker'),
        position: point,
      ),
    );
    emit(SetMarkerState());
  }

  /// Set Point Manual
  void setPointManual(point) {
    setMarker(point);
    lng = point.longitude;
    lat = point.latitude;
    getAddress(lat!, lng!);
    emit(SetManualState());
  }

  /// Set Point Auto
  void setPointAuto(double latitude, double longitude) {
    lat = latitude;
    lng = longitude;
    getAddress(latitude, longitude);
    emit(SetAutoState());
  }

  /// Get Address Details
  Future<void> getAddress(double lat, double lng) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lng);
    Placemark place = placeMark[0];

    /// in single method
    // address = "${place.locality} , ${place.name} , ${place.administrativeArea}";
    address = "${place.locality} , ${place.name} ";
    prefService.setValue("address", address);
    prefService.setValue("lat", lat.toString());
    prefService.setValue("lng", lng.toString());
    emit(GetAddressState());
  }

  /// Go to Place
  Future<void> goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: 12,
      ),
    ));

    setMarker(LatLng(lat, lng));
    setPointAuto(lat, lng);
    getAddress(lat, lng);
    emit(GoToPlaceState());
  }

  /// back to home_apis
  Future<void> backToHome(double? latitude, double? longitude) async {
    final double lat = latitude!;
    final double lng = longitude!;
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: 12,
      ),
    ));

    setMarker(LatLng(lat, lng));
    setPointAuto(lat, lng);
    getAddress(lat, lng);
    emit(BackToHomeState());
  }
}
