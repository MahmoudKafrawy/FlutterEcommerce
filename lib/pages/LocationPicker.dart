import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker_flutter/google_map_location_picker_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPicker extends StatefulWidget {
  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Position? position;
  getGPS() async {
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
      addressPlaceHolder: "حرك الخريطة",
      addressTitle: "عنوان التوصيل",
      apiKey: "",
      appBarTitle: "حدد موقع التوصيل",
      confirmButtonColor: Colors.blue,
      confirmButtonText: "تأكيد الموقع",
      confirmButtonTextColor: Colors.black,
      country: "sa",
      language: "ar",
      searchHint: "ابحث عن موقع",
      initialLocation: LatLng(position.latitude, position.longitude),
      // latLngBounds: LatLngBounds(
      //     southwest: LatLng(26.778969408634744, 49.64998426596829),
      //     northeast: LatLng(27.18223196943455, 49.5800677040946)),
      // outOfBoundsMessage: "الخدمة غير متوفرة حاليا في هذه المنطقة"
    );
    if (result != null) {
      print(result.address);
    }
  }

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
    getGPS();
    return Scaffold(
        body: position == null
            ? Center(child: CircularProgressIndicator())
            : getGPS());
  }
}
