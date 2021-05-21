import 'package:flutter/material.dart';
import '/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            child: Center(
              child: Image(
                image: AssetImage('images/logo.png'),
              )
            )
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.home,
              color: kMainColor,
            ),
            title: Text('Home'),
          ),

          ListTile(
            onTap: () {
             launch('https://paypal.me/nearbyWater?locale.x=en_US');
            },
            leading: Image(
              width: 15,
              image: AssetImage('images/paypal.png'),
            ),
            title: Text('Support us by \$5'),
            //https://paypal.me/nearbyWater?locale.x=en_US
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/terms');
            },
            leading: Icon(
              Icons.check_circle,
              color: kMainColor,
            ),
            title: Text('Terms & Condistions'),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/privacy');
            },
            leading: Icon(
              Icons.privacy_tip,
              color: kMainColor,
            ),
            title: Text('Privacy and copyrights'),
          ),



        ],
      ),
    );
  }
}