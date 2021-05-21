

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '/screens/thank_you_screen.dart';
import 'dart:async';

class MapSelect extends StatefulWidget {
  static String id = 'map_select';
  double lat;
  double lng;
  
  //constractors
  MapSelect({this.lat,this.lng});


  @override
  _MapSelectState createState() => _MapSelectState();
}

class _MapSelectState extends State<MapSelect> {
  bool showSpinner = false;
  static double lat;
  static double lng;
  GoogleMapController mapConroller;
  Marker waterTapPosition;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();

// Future<dynamic> getBytesFromAsset(String path, int width) async {
//   ByteData data = await rootBundle.load(path);
//   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//   ui.FrameInfo fi = await codec.getNextFrame();
//   return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
// }


  //when map created
  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapConroller = controller;
      //mapConroller.addMarker();      
    });
  }

  //animato to user position
  _animateToUser() {
    mapConroller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat,lng),
          zoom:15,

        )
      )
    );
  }
  
  //add marker 
  _addMarker(LatLng pos) {
    setState(() {
      waterTapPosition = Marker(
        markerId: MarkerId('watertap'),
        infoWindow: InfoWindow(title:'Water Tap'),
        icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos
      );
    });
  }

  //toggle loading
  void toggleSinner(bool value) {
    setState(() {
        showSpinner = value;
    });
  }
//   //add location to firestore
  Future<DocumentReference> _addGeoPoint() {
 

    GeoFirePoint point = geo.point(
      latitude: waterTapPosition.position.latitude,
      longitude: waterTapPosition.position.longitude
    );
    return firestore.collection('water-taps').add({
      "position":point.data
    });
  }
  //set the lat and long
  @override
    void initState() {
      super.initState();
      lat = widget.lat;
      lng = widget.lng;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
 
          _animateToUser();
        },
        backgroundColor: kMainColor,
        child: Icon(
          Icons.gps_fixed
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall:showSpinner,
        color: kMainColor,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat,lng),
                zoom:14.5
              ),
              zoomControlsEnabled: false,
              onMapCreated:_onMapCreated,
              myLocationEnabled:true,
              myLocationButtonEnabled: false,
              onTap: _addMarker,
              onLongPress: _addMarker,
              markers:{
                if(waterTapPosition != null) waterTapPosition
              }
            ),
            if(waterTapPosition != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom:15),
                child: ElevatedButton(
                  onPressed:() async {
                    toggleSinner(true);
                    await _addGeoPoint();
                    toggleSinner(false);
                    Navigator.pushNamed(context, ThankYouScreen.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    )
                  ),
                  child: Text(
                    'Add selected location',
                    style: TextStyle(
                      fontSize: 22
                    ),  
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}