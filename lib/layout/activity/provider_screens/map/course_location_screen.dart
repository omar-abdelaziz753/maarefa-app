import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/value/color/color.dart';
import '../../../../res/value/dimenssion/dimenssions.dart';
import '../../../../res/value/style/textstyles.dart';
import '../../../../widget/app_bar/default_app_bar/default_app_bar.dart';
import '../../../../widget/background/background_image.dart';
import '../../../../widget/side_padding/side_padding.dart';
import '../../../../widget/space/space.dart';

class CourseLocationScreen extends StatefulWidget {
  final double lat, lng;
  const CourseLocationScreen({super.key, required this.lat, required this.lng});

  @override
  State<CourseLocationScreen> createState() => _CourseLocationScreenState();
}

class _CourseLocationScreenState extends State<CourseLocationScreen> {
  TextEditingController address = TextEditingController();
  Completer<GoogleMapController> mapController = Completer();
  // LatLng? center;
  Set<Marker> markers = {};
  // LatLng? lastMapPosition;
  MapType currentMapType = MapType.normal;
  String addressTitle = "";
  String detail = "";
  bool serviceEnabled = false;

  // setLocation() {
  //   setState(() => center = LatLng(widget.lat, widget.lng));
  // }

  onAddMarkerButtonPressed() {
    markers.clear();
    setState(() {
      markers.add(Marker(
          markerId: MarkerId(LatLng(widget.lat, widget.lng).toString()),
          position: LatLng(widget.lat, widget.lng),
          infoWindow: InfoWindow(title: addressTitle, snippet: detail),
          icon: BitmapDescriptor.defaultMarker));
    });
    // emit(MarkButtonState());
  }

  getUserLocation() async {
    // final coordinates = Coordinates(widget.lat, widget.lng);
    // var addresses =
    //     await Geocoder.local.findAddressesFromCoordinates(coordinates);
    List<Placemark> placeMark =
        await placemarkFromCoordinates(widget.lat, widget.lng);
    Placemark place = placeMark[0];
    var first = place;
    // var first = addresses.first;
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 10),
      ),
    );
    setState(() {
      addressTitle = first.country!;
      detail = first.name!;
      address.text = "${first.locality!}   ${first.name!}";
      // emit(UserAddressState());
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() => mapController.complete(controller));
    // emit(MapCreatedState());
  }

  // void onCameraMove(CameraPosition position) {
  //   setState(() => lastMapPosition = position.target);
  //   // emit(CameraMoveState());
  // }

  @override
  void initState() {
    super.initState();
    // setLocation();
    getUserLocation();
    onAddMarkerButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //     create: (BuildContext context) => AddressCubit(AddressRepository()),
    //     child: BlocConsumer<AddressCubit, AddressState>(
    //         listener: (context, state) {},
    //         builder: (context, state) {
    //           final bloc = AddressCubit.get(context);
    return SafeArea(
      child: BackgroundImage(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: DefaultAppBar(
              title: "", backgroundColor: transparent, isBack: true),
          body: Stack(
            alignment: FractionalOffset.bottomCenter,
            children: [
              GoogleMap(
                mapToolbarEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                onMapCreated: onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.lat, widget.lng), zoom: 0.0),
                markers: markers,
                mapType: currentMapType,
                // onCameraMove: onCameraMove,
              ),
              Container(
                color: white,
                width: screenWidth,
                height: screenHeight * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(tr('address_details'),
                        style: GoogleFonts.tajawal(
                          fontSize: 15,
                          color: black,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      height: 4,
                      width: screenWidth * 0.2,
                      color: mainColor,
                    ),
                    const Space(
                      boxHeight: 10,
                    ),
                    Container(
                      color: white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SidePadding(
                            sidePadding: 15,
                            child: Container(
                              height: screenHeight * 0.2,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                border: Border.all(width: 1, color: mainColor),
                              ),
                              child: Text(
                                address.text,
                                style: TextStyles.appBarStyle
                                    .copyWith(color: mainColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Space(
                      boxHeight: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // }));
  }
}
