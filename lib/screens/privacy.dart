
import 'package:flutter/material.dart';
import '/constants.dart';
class Privacy extends StatelessWidget {
  static String id  = 'privacy';
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
        title: Text('Privacy'),
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
                'Your Privacy',
                style: kHeadLines,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Reservation of Rights',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.',
                style: kParagraphStyle,
             
              ),
              SizedBox(height: 10),
              Text(
                'Removal of links from our website',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              Text(
                'If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.',
                style: kParagraphStyle,
            
              ),
              Text(
                'We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.',
                style: kParagraphStyle,
              ),
              SizedBox(height: 20),
              Text(
                'Disclaimer',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:',
                style: kParagraphStyle,
              ),
              Text(
                'limit or exclude our or your liability for death or personal injury;',
                style: kParagraphStyle,
              ),
              Text(
                'limit or exclude our or your liability for fraud or fraudulent misrepresentation;',
                style: kParagraphStyle,
              ),
              Text(
                'limit any of our or your liabilities in any way that is not permitted under applicable law; or',
                style: kParagraphStyle,
              ),
              Text(
                'exclude any of our or your liabilities that may not be excluded under applicable law.',
                style: kParagraphStyle,
              ),
              Text(
                'The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.',
                style: kParagraphStyle,
              ),
              Text(
                '- In case of any unauthorized activity through your Maximize account, you may immediately notify the Maximize team.',
                style: kParagraphStyle,
              ),
              Text(
                'As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.',
                style: kParagraphStyle,
              ),



            ],
          ),
        )
      ),
    );
  }
}