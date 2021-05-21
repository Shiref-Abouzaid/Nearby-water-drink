
import 'package:flutter/material.dart';
import '/constants.dart';
import '/components/roundedButton.dart';
import '/screens/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '/components/roundedOutlinedButton.dart';
class ThankYouScreen extends StatelessWidget {
  static String id = 'thank_you_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
       
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
           
                Image(
                  image: AssetImage('images/thank_you.png'),
                  width: 250,
                ),
      
                Text(
              'Thank You',
                style: TextStyle(
                  fontSize: 45,
                  color: kMainColor
                ),
              ),
              ],
            )
          ),


          Expanded(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedOutlinedButton(
                  icon:  Image(
                    width: 15,
                    image: AssetImage('images/paypal.png'),
                  ),
                  text: 'Support us with \$2',
                  onPressed: () {
                    launch('https://paypal.me/nearbyWater?locale.x=en_US');
                  },
                ),


                SizedBox(height: 10,),
                RoundedButton(
                  text: 'Home',
                  icon: Icons.home,
                  onPressed: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                )
              ],
            ) ,
          ),

        ],
      ),
    );
  }
}