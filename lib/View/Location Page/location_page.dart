import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:pitch_me_app/View/Location%20Page/location_page_con.dart';
import 'package:pitch_me_app/View/navigation_controller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/extras/extras.dart';
import 'package:pitch_me_app/utils/strings/keys.dart';
import 'package:pitch_me_app/utils/styles/styles.dart';
import 'package:pitch_me_app/utils/widgets/Arrow%20Button/arrow_button.dart';
import 'package:pitch_me_app/utils/widgets/Navigation/custom_navigation.dart';
import 'package:sizer/sizer.dart';

import '../../utils/strings/strings.dart';
import '../Custom header view/custom_header_view.dart';
import '../Custom header view/new_bottom_bar.dart';
import '../what need/what_need_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationPageController _locationPageController =
      Get.put(LocationPageController());
  final NavigationController _navigationController =
      Get.put(NavigationController());
  GlobalKey<FormState> abcKey = GlobalKey<FormState>();
  String customText = '';
  int checkColor = 0;
  int openSearchBox = 0;
  Location location = Location();
  Completer<GoogleMapController> controllerCompleter = Completer();

  Set<Marker> markers = <Marker>{};
  CameraPosition initialLocation =
      const CameraPosition(target: LatLng(0.0, 0.0));

  double currentLatitude = 0.0;
  double currentLongitude = 0.0;
  double placeLatitude = 0.0;
  double placeLongitude = 0.0;

  String placeAddress = '';
  //String selectedType = '';

  getCurentPosign() async {
    try {
      location.requestPermission().then((value) {});
      location.getLocation().then((value) {
        if (value != null) {
          currentLatitude = value.latitude!;
          currentLongitude = value.longitude!;
          initialLocation = CameraPosition(
            target: LatLng(value.latitude!, value.longitude!),
            zoom: 14.0,
          );

          markers.add(
            Marker(
              markerId: const MarkerId('place'),
              position: LatLng(value.latitude ?? 0.0, value.longitude ?? 0.0),
              //infoWindow: InfoWindow(title: element.driverName),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
          getAddress(value.latitude!, value.longitude!);
        }
      });
    } catch (e) {
      location.requestPermission();
    }
  }

  Future<Null> displayPrediction(Prediction p) async {
    try {
      if (p != null) {
        markers.clear();
        final lat = double.parse('${p.lat}').toDouble();

        final lng = double.parse('${p.lng}').toDouble();
        placeAddress = p.description!;
        placeLatitude = double.parse('${p.lat}').toDouble();
        placeLongitude = double.parse('${p.lng}').toDouble();
        final GoogleMapController controller = await controllerCompleter.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat.toDouble(), lng.toDouble()),
            zoom: 14.0,
          ),
        ));

        markers.add(
          Marker(
            draggable: false,
            markerId: const MarkerId('place'),
            position: LatLng(lat.toDouble(), lng.toDouble()),
            //infoWindow: const InfoWindow(title: 'Find Place'),
          ),
        );
        setState(() {});
      }
    } catch (e) {
      log('location = ' + e.toString());
    }
  }

  void getAddress(lat, lang) async {
    try {
      String url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lang&key=${Keys.googleApiKey}';

      var response = await http.get(Uri.parse(url));
      var jsonResponce = jsonDecode(response.body.toString());

      _locationPageController.searchController.text =
          jsonResponce['results'][0]['formatted_address'];
    } catch (e) {
      log('message = ' + e.toString());
    }
  }

  @override
  void initState() {
    getCurentPosign();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          checkColor != 0
              ? ArrowButton(
                  onPressed: () {
                    try {
                      // Get.back();
                      if (_navigationController.navigationType.value ==
                          'Post') {
                        PageNavigateScreen().push(
                            context,
                            WhatNeedPage(
                              key: abcKey,
                            ));
                      } else {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                )
              : Container(),
          NewCustomBottomBar(),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        primary: false,
        children: [
          CustomHeaderView(
            title: TextStrings.textKey['location']!,
            icon: 'assets/icons/near_me.png',
            subTitle: TextStrings.textKey['sub_location']!,
            progressPersent: 0.2,
            padding: 0,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child:
                        customBox(10.0, 10.0, 0.0, 0.0, Icons.wifi, 'Online', 1,
                            onPressad: () {
                  _locationPageController.selectedType.value = 'Online';
                  setState(() {
                    customText = 'Your Business is Online';
                    checkColor = 1;
                    openSearchBox = 0;
                  });
                })),
                Container(
                  width: 2,
                  height: 6.h,
                  color: DynamicColor.white,
                ),
                Expanded(
                    child: customBox(
                  0.0,
                  0.0,
                  0.0,
                  0.0,
                  Icons.public,
                  'Anywhere',
                  2,
                  onPressad: () {
                    _locationPageController.selectedType.value = 'Anywhere';
                    setState(() {
                      customText = 'Your Business works Anywhere';
                      checkColor = 2;
                      openSearchBox = 0;
                    });
                  },
                )),
                Container(
                  width: 2,
                  height: 6.h,
                  color: DynamicColor.white,
                ),
                Expanded(
                    child: customBox(
                  0.0,
                  0.0,
                  10.0,
                  10.0,
                  Icons.location_on,
                  'Place',
                  3,
                  onPressad: () {
                    setState(() {
                      _locationPageController.selectedType.value = 'Place';
                      customText = 'Find your Business Area';
                      checkColor = 3;
                      openSearchBox = 1;
                    });
                  },
                )),
              ],
            ),
          ),
          Column(
            children: [
              textWidget(),
              openSearchBox == 1 ? searchBox() : Container(),
              const SizedBox(height: 20),
              openSearchBox == 1 ? googleMap() : Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget textWidget() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        child: Text(
          customText,
          style: blue12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: DynamicColor.blue,
              size: 36,
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 5.h,
                child: GooglePlaceAutoCompleteTextField(
                    textEditingController:
                        _locationPageController.searchController,
                    googleAPIKey: Keys.googleApiKey,
                    onTap: () {
                      _locationPageController.searchController.text = '';
                    },
                    textStyle: blue15,
                    inputDecoration: InputDecoration(
                        hintText: 'Type',
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: DynamicColor.blue.withOpacity(0.5)),
                        border: outlineInputBorderBlue,
                        enabledBorder: outlineInputBorderBlue,
                        disabledBorder: outlineInputBorderBlue,
                        focusedBorder: outlineInputBorderBlue,
                        contentPadding: const EdgeInsets.only(
                            bottom: 5, left: 5, right: 5)),
                    countries: const ["in", "us"],
                    currentLatitude: currentLatitude,
                    currentLongitude: currentLongitude,
                    isLatLngRequired: true,
                    getPlaceDetailWithLatLng: (Prediction prediction) {
                      _locationPageController.searchController.text =
                          prediction.description!;
                      displayPrediction(prediction);
                    },
                    itmClick: (Prediction prediction) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    })),
          ),
        ],
      ),
    );
  }

  Widget googleMap() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 27.h,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: GoogleMap(
          markers: Set<Marker>.from(markers),
          initialCameraPosition: initialLocation,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            setState(() {
              controllerCompleter.complete(controller);
              getCurentPosign();
            });
          },
        ),
      ),
    );
  }

  Widget customBox(topLeft, bottomLeft, topRight, bottomRight,
      IconData iconData, String string, int isCheck,
      {required VoidCallback onPressad}) {
    return InkWell(
      onTap: onPressad,
      child: Container(
        height: 6.h,
        // padding: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: DynamicColor.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              bottomLeft: Radius.circular(bottomLeft),
              topRight: Radius.circular(topRight),
              bottomRight: Radius.circular(bottomRight),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: checkColor == isCheck
                  ? DynamicColor.darkBlue
                  : DynamicColor.white,
            ),
            Text(
              string,
              style: checkColor == isCheck ? darkBlue15 : white15TextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  void onMapDispose() async {
    final GoogleMapController controller = await controllerCompleter.future;
    controller.dispose();
    log('dispose');
  }

  @override
  void dispose() {
    onMapDispose();
    super.dispose();
  }
}
