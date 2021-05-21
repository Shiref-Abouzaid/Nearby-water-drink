import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:nearby_water_drink/constants.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/constants.dart';
import 'package:map_launcher/map_launcher.dart';
class MapScreen extends StatefulWidget {
  static String id = 'map_screen';
  double lat;
  double lng;
  MapScreen({this.lat,this.lng});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static double lat;
  static double lng;
  GoogleMapController mapConroller;
  Geoflutterfire geo = Geoflutterfire();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  BitmapDescriptor myIcon;

  static CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(lat, lng),
    zoom:14.5
  );

  GoogleMapController _googleMapController;
  BehaviorSubject<double> raduis = BehaviorSubject.seeded(100.0);
  Stream<dynamic> query;
  StreamSubscription subscription;


  _onMapCreated(GoogleMapController controller) {
    
    _startQuery();
    setState(() {
      mapConroller = controller;   
    });
  }

  //convert object to map because I cant select property of object
  Map<String, dynamic> toMap(obj) {
    return {
      'position': obj["position"],

    };
  }
  //query locations of water taps
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Marker mark;



  
  void _updateMarkers(List<DocumentSnapshot> documentList) {


    documentList.forEach((DocumentSnapshot document) {
      var markerIdVal = toMap(document.data())["position"]["geohash"];
      final MarkerId markerId = MarkerId(markerIdVal);

      GeoPoint pos = toMap(document.data())["position"]["geopoint"];
      print(pos.latitude);
      var marker = Marker(
        position: LatLng(pos.latitude,pos.longitude),
        //icon:BitmapDescriptor.defaultMarker,
        markerId: MarkerId(markerIdVal),
        icon: myIcon,
        onTap: () async {
          print('marker tapped');
          final availableMaps = await MapLauncher.installedMaps;
          await availableMaps.first.showMarker(
            coords: Coords(pos.latitude, pos.longitude),
            title: "Water Tap",
          );
        }
      );
      setState(() {
        // adding a new marker to map
         markers[markerId] = marker;
      });
    });
  }

  //query
  _startQuery() async {
    var ref = firestore.collection('water-taps');
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);
    //subscription to query
    subscription = raduis.switchMap((rad){
      return geo.collection(collectionRef: ref).within(
        center: center,
        radius: rad,
        field: 'position',
        strictMode:true
      );
    }).listen(_updateMarkers);
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


  _updateQuery(value) {
    final zoomMap = {
      100.0:12.0,
      200.0:10.0,
      300.0:7.0,
      400.0:6.0,
      500.0:5.0
    };
    final zoom = zoomMap[value];
    mapConroller.moveCamera(CameraUpdate.zoomTo(zoom));
    setState(() {
      raduis.add(value);      
    });
  } 
  @override
    void dispose() {
      _googleMapController.dispose();
      subscription.cancel();
      super.dispose();
    }
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), 'images/marker.png')
        .then((onValue) {
        myIcon = onValue;
      });
      lat = widget.lat;
      lng = widget.lng;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,

            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat,lng),
              zoom:15.5
            ),
            onMapCreated:_onMapCreated,
            myLocationEnabled:true,
            markers: Set<Marker>.of(markers.values),

          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Slider(
              min:100.0,
              max:500.0,
              label: 'Raduis ${raduis.value}km',
              value: raduis.value,
              activeColor: kMainColor,
              inactiveColor: Colors.green,
              onChanged:_updateQuery
            ),
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () {
 
          _animateToUser();
        },
        child: Icon(
          Icons.location_searching
        ),
      ),
    );
  }
}