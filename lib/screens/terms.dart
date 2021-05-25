import 'package:flutter/material.dart';
import '/constants.dart';
class Terms extends StatelessWidget {
  static String id = 'terms';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Image(
                width: 30,
                image: AssetImage('images/logo-in-white.png'),
              ),
            ),
        ],
        title: Text('Terms and Conditions'),
         backgroundColor: kMainColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Terms and Conditions',
                style: kHeadLines,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to nearest-water!',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'These terms and conditions outline the rules and regulations for the use of nearest water\'s Website, located at nearest-water.tk.',
                style: kParagraphStyle,
           
              ),
              SizedBox(height: 20),

              Text(
                'By accessing this website we assume you accept these terms and conditions. Do not continue to use nearest-water if you do not agree to take all of the terms and conditions stated on this page.',
                style: kParagraphStyle,
              ),
              Text(
                'The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.',
                style: kParagraphStyle,
              ),
              Text(
                'Cookies',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              Text(
                'We employ the use of cookies. By accessing nearest-water, you agreed to use cookies in agreement with the nearest water\'s Privacy Policy. ',
                style: kParagraphStyle,
              ),
              Text(
                'Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.',
                style: kParagraphStyle,
              ),
              Text(
                'License',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              Text(
                'Unless otherwise stated, nearest water and/or its licensors own the intellectual property rights for all material on nearest-water. All intellectual property rights are reserved. You may access this from nearest-water for your own personal use subjected to restrictions set in these terms and conditions.',
                style: kParagraphStyle,
              ),
              Text(
                'You must not:',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              Text(
                '- Republish material from nearest-water',
                style: kParagraphStyle,
              ),
              Text(
                '- Sell, rent or sub-license material from nearest-water',
                style: kParagraphStyle,
              ),
              Text(
                '- Reproduce, duplicate or copy material from nearest-water',
                style: kParagraphStyle,
              ),
              Text(
                '- Redistribute content from nearest-water',
                style: kParagraphStyle,
              ),
              Text(
                'This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Terms And Conditions Generator and the Privacy Policy Generator.',
                style: kParagraphStyle,
              ),
              Text(
                'Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. nearest water does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of nearest water,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, nearest water shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.',
                style: kParagraphStyle,
              ),
              Text(
                'nearest water reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.',
                style: kParagraphStyle,
              ),

            ],
          ),
        )
      ),
    );
  }
}