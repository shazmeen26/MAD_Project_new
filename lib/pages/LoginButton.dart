import 'package:flutter/material.dart';

import 'centerlogin.dart';
import 'login_page.dart';


class LoginPageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nasha Mukti Portal' ,  style: TextStyle(
          color: Colors.white, // Change text color to white
        ),),
        backgroundColor: Colors.blue[800],
          centerTitle: true,


      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // // Display the image above the form
            // Image.asset(
            //   'lib/images/firstpage.png',
            //   fit: BoxFit.cover,
            // ),

            const SizedBox(height: 50),


            // welcome back
            Container(
              padding: EdgeInsets.all(16), // Add padding around the Text widget
              child: Text(
                'Breaking Chains, Building Lives!',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 50,
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(onTap: () {  },)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                minimumSize: Size(320, 50),
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('User Login',
                style: TextStyle(
                  color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                )
              ),

            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CenterLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900], // Change button color here
                minimumSize: Size(320, 50), // Change button size here
                padding: EdgeInsets.all(20), // Padding around the button content
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Change border radius here
                ),
              ),
              child: Text('Center Login',
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class UserLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Center(
        child: Text('User Login Screen'),
      ),
    );
  }
}

class CenterLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center Login'),
      ),
      body: Center(
        child: Text('Center Login Screen'),
      ),
    );
  }
}
