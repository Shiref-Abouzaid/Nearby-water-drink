import 'package:flutter/material.dart';
import 'package:nearby_water_drink/components/roundedOutlinedButton.dart';
import 'package:nearby_water_drink/constants.dart';
import 'package:nearby_water_drink/screens/thank_you_screen.dart';
import '/components/roundedButton.dart';

import '/services/location.dart';
import '/screens/map_select.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class BottomModal extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  Future<DocumentReference> _addGeoPoint(pos) {
    GeoFirePoint point = geo.point(
      latitude: pos.lat,
      longitude: pos.lng
    );
    return firestore.collection('water-taps').add({
      "position":point.data
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Container(
        child: Column(
          children:[

            Image(
              height: 160,
              image :  AssetImage('images/locationgif.gif'),
              //image:NetworkImage('https://cdn.dribbble.com/users/174627/screenshots/4891881/dribbble_jumpingpin.gif')
            ),

            RoundedOutlinedButton(
              text:'Current Location',
              icon:Icon(
                Icons.gps_fixed,
                color:kMainColor,
              ),
              onPressed: () async {
                Location location = new Location();
                await location.getCurrentLocation();
                await _addGeoPoint(location);
                Navigator.pushNamed(context, ThankYouScreen.id);
              },
            ),
            RoundedButton(
              text:'Select different',
              icon:Icons.add_location_alt_outlined,
              onPressed: () async {
                Location location = new Location();
                await location.getCurrentLocation();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>MapSelect(
                      lat:location.lat,
                      lng: location.lng,
                    )
                  )
                );
              },
            )

          ] 
        
        ),

      ),

    );
  }
}