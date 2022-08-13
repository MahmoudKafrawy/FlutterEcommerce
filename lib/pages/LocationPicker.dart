import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker_flutter/google_map_location_picker_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' hide LocationAccuracy;

class LocationPicker extends StatefulWidget {
  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Position? position;

  chkGPS() async {
    Location location = Location();
    bool ison = await location.serviceEnabled();
    if (!ison) {
      //if defvice is off
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        print("GPS device is turned ON");
      } else {
        print("GPS Device is still OFF");
      }
    }
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    AddressResult result = await showGoogleMapLocationPicker(
      pinWidget: Icon(
        Icons.location_pin,
        color: Colors.red,
        size: 55,
      ),
      pinColor: Colors.blue,
      context: context,
      addressPlaceHolder: "iti Suez Canal",
      addressTitle: "عنوان التوصيل",
      apiKey: "AIzaSyCVn9thXMk_mAJ7i8JxmoKGQCX47KfLyiw",
      appBarTitle: "حدد موقع التوصيل",
      confirmButtonColor: Colors.blue,
      confirmButtonText: "تأكيد الموقع",
      confirmButtonTextColor: Colors.black,
      country: "eg",
      language: "ar",
      searchHint: "ابحث عن موقع",
      initialLocation: LatLng(position.latitude, position.longitude),
      // latLngBounds: LatLngBounds(
      //     southwest: LatLng(26.778969408634744, 49.64998426596829),
      //     northeast: LatLng(27.18223196943455, 49.5800677040946)),
      // outOfBoundsMessage: "الخدمة غير متوفرة حاليا في هذه المنطقة"
    );
  }

  void getLocation() async {
    // bool serviceEnabled;
    // LocationPermission permission;

    // // Test if location services are enabled.
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   return Future.error('Location services are disabled.');
    // }

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // Permissions are denied, next time you could try
    //     // requesting permissions again (this is also where
    //     // Android's shouldShowRequestPermissionRationale
    //     // returned true. According to Android guidelines
    //     // your App should show an explanatory UI now.
    //     return Future.error('Location permissions are denied');
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }

    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    // print(position);
  }

  // getGPS() async {
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

  //   print(position);

  //   AddressResult result = await showGoogleMapLocationPicker(
  //     pinWidget: Icon(
  //       Icons.location_pin,
  //       color: Colors.red,
  //       size: 55,
  //     ),
  //     pinColor: Colors.blue,
  //     context: context,
  //     addressPlaceHolder: "تلاتة",
  //     addressTitle: "عنوان التوصيل",
  //     apiKey: "AIzaSyCVn9thXMk_mAJ7i8JxmoKGQCX47KfLyiw",
  //     appBarTitle: "حدد موقع التوصيل",
  //     confirmButtonColor: Colors.blue,
  //     confirmButtonText: "تأكيد الموقع",
  //     confirmButtonTextColor: Colors.black,
  //     country: "sa",
  //     language: "ar",
  //     searchHint: "ابحث عن موقع",
  //     initialLocation: LatLng(position.latitude, position.longitude),
  //     // latLngBounds: LatLngBounds(
  //     //     southwest: LatLng(26.778969408634744, 49.64998426596829),
  //     //     northeast: LatLng(27.18223196943455, 49.5800677040946)),
  //     // outOfBoundsMessage: "الخدمة غير متوفرة حاليا في هذه المنطقة"
  //   );
  //   if (result != null) {
  //     print(result.address);
  //   }
  // }

  // void initState() {
  //   void getCurrentLocation() async {
  //     final position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.low);

  //     setState(() {
  //       _lat = position.latitude;
  //       _lon = position.longitude;
  //     });
  //   }
  //   // TODO: implement initState
  //   // _getCurrentLocation() async {
  //   //   await Geolocator.getCurrentPosition(
  //   //           desiredAccuracy: LocationAccuracy.high)
  //   //       .then((Position position) {
  //   //     setState(() {
  //   //       _lat = 22;
  //   //     });
  //   //   }).catchError((e) {
  //   //     print(e);
  //   //   });
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: position == null
          ? Center(child: CircularProgressIndicator())
          : showGoogleMapLocationPicker(
              pinWidget: Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 55,
              ),
              pinColor: Colors.blue,
              context: context,
              addressPlaceHolder: "اتنين",
              addressTitle: "عنوان التوصيل",
              apiKey: "AIzaSyCVn9thXMk_mAJ7i8JxmoKGQCX47KfLyiw",
              appBarTitle: "حدد موقع التوصيل",
              confirmButtonColor: Colors.blue,
              confirmButtonText: "تأكيد الموقع",
              confirmButtonTextColor: Colors.black,
              country: "eg",
              language: "ar",
              searchHint: "ابحث عن موقع",
              initialLocation: LatLng(position!.latitude, position!.longitude),
              // latLngBounds: LatLngBounds(
              //     southwest: LatLng(26.778969408634744, 49.64998426596829),
              //     northeast: LatLng(27.18223196943455, 49.5800677040946)),
              // outOfBoundsMessage: "الخدمة غير متوفرة حاليا في هذه المنطقة"
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    chkGPS();
  }
}
