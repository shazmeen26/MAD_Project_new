import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'DisplayCenters.dart';
import 'ViewAppointment.dart'; // Import the doc.dart file
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final user = FirebaseAuth.instance.currentUser!;

  // Sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context); // Pop back to previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nasha Mukti",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => signUserOut(context),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(

              ),
              margin: EdgeInsets.all(20),
              child: ClipRRect(

                child: CarouselSlider(

                  options: CarouselOptions(
                    height: 190.0,

                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                    viewportFraction: 0.99g,
                  ),
                  items: [
                    // Replace these Image.asset widgets with your actual images
                    Image.asset('lib/images/drug.png', fit: BoxFit.cover),

                    Image.network('https://assets-global.website-files.com/6092dc6b87cb4a214c3c2dde/643f73467fbf68dc140c7024_Self%20Help%20does%20not%20work%20in%20Substance%20Abuse%20Recovery2.png')
                    ,Image.network('https://anchoredtidesrecovery.com/wp-content/uploads/2022/02/Parenting-Someone-with-a-Cocaine-Addiction1.jpg'),
                    Image.network('https://drugfreecountry.com/wp-content/uploads/2022/11/istockphoto-1380976736-612x612-1.jpg')
                  ],
                ),
              ),
            ),

            // Row containing the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewAppointment()),
                    );
                  },
                  label: Text(
                    "Appointments",
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(Icons.calendar_today),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayCenters()),
                    );
                  },
                  label: Text(
                    "Rehab centers",
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(Icons.local_hospital),
                ),
              ],
            ),

            buildTimelineItem(
              title: 'Register',
              onPressed: () {},
              isFirst: true,
              icon: Icons.article,
              hasCheckbox: true,
            ),
            buildTimelineItem(
              title: 'Appointment',
              onPressed: () {
                // Action for Appointment
              },
              icon: Icons.calendar_today,
              hasCheckbox: true,
            ),
            buildTimelineItem(
              title: 'Admit',
              onPressed: () {
                // Action for Admit
              },
              icon: Icons.local_hospital,
              hasCheckbox: true,
            ),
            buildTimelineItem(
              title: 'Treatment',
              onPressed: () {
                // Action for Treatment
              },
              icon: Icons.healing,
              hasCheckbox: true,
            ),
            buildTimelineItem(
              title: 'Release',
              onPressed: () {
                // Action for Release
              },
              icon: Icons.check_box,
              hasCheckbox: true,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTimelineItem({
  required String title,
  required VoidCallback onPressed,
  bool isFirst = false,
  bool isLast = false,
  IconData? icon,
  bool hasCheckbox = false,
}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 20.0),
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              height: 3.0,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
      ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: onPressed,
        trailing: hasCheckbox
            ? Checkbox(
          activeColor: Colors.deepPurple,
          value: title == 'Register',
          onChanged: (newValue) {
            // Handle checkbox state change
          },
        )
            : null,
      ),
    ],
  );
}
