import 'package:flutter/material.dart';
import 'package:nearby_water_drink/components/roundedOutlinedButton.dart';
import 'package:nearby_water_drink/screens/map_screen.dart';
import '/components/navbar.dart';
import '/constants.dart';
import '/components/roundedButton.dart';
import '/components/bottom_modal.dart';
import '/services/location.dart';

class Home extends StatelessWidget {

  //toggle loading

  static String id = 'home_screen';
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