import 'package:flutter/material.dart';
import 'package:nearby_water_drink/components/roundedOutlinedButton.dart';
import 'package:nearby_water_drink/screens/map_screen.dart';
import '/components/navbar.dart';
import '/constants.dart';
import '/components/roundedButton.dart';
import '/components/bottom_modal.dart';
import '/services/location.dart';
//import 'package:firebase_admob/firebase_admob.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import '/helper/ad_helper.dart';
class Home extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  BannerAd _ad;
  bool isLoaded;

  _openBottomModal(context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
      ),

      context: context,
      builder: (BuildContext bc) {
        return BottomModal();
      });
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }
  Widget checkForAd(){
    if(isLoaded == true) {
      return Container(
  
        child: AdWidget(
          ad: _ad
        ),
        width: _ad.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return CircularProgressIndicator();
    }
  }
  @override
  void initState() {
    super.initState();
    _ad = BannerAd(
      adUnitId: 'ca-app-pub-9548270312571067/2033447768',
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (_,err) {
          print(err);
        }
      )
    );

    _ad.load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title:Text(
          'Nearby Water',

        ),

  
      ),
      drawer: NavBar(),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          SizedBox(height: 20),
          Expanded(
            flex:2,
            child:Column(
              children: [
                Image(
                  image: AssetImage('images/cover_home.png'),
                  height: 150,
                ),
                SizedBox(height: 20,),
                checkForAd(),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        'Nearby Water for travelers, to know the nearist free water, Remember you can add new one to the collection of your visited country',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Patrick Hand',
                          fontSize: 18,
                          
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
    
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image(
                  image: AssetImage('images/logo.png'),
                  height:75
                ),
                SizedBox(height: 20),
                RoundedOutlinedButton(
                  text: 'Get Nearest',
                  icon: Icon(
                    Icons.search_outlined,
                    color: kMainColor,  
                  ),
                  onPressed: () async{
   
                    Location location = new Location();
                    await location.getCurrentLocation();
           
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=>MapScreen(
                          lat:location.lat,
                          lng: location.lng,
                        )
                      )
                    );
                  }
                ),
                SizedBox(height: 10,),
                RoundedButton(
                  icon: Icons.add_location_alt_outlined,
                  text:'Add One',
                  onPressed: () {
                    _openBottomModal(context);
                  },
                ),
              ],
            )
          )
        ]
      )
    );
  }
}
