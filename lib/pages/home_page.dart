import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'DisplayCenters.dart';
import 'ViewAppointment.dart'; // Import the doc.dart file
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isRegistered = true; // State variable to track registration checkbox
  bool appointmentChecked = false;
  bool admitChecked = false;
  bool treatmentChecked = false;
  bool releaseChecked = false;
  // Sign user out method
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login'); // Pop back to previous screen
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
              shape: RoundedRectangleBorder(),
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
                    viewportFraction: 0.99,
                  ),
                  items: [
                    Image.asset('lib/images/drug.png', fit: BoxFit.cover),
                    Image.network(
                        'https://assets-global.website-files.com/6092dc6b87cb4a214c3c2dde/643f73467fbf68dc140c7024_Self%20Help%20does%20not%20work%20in%20Substance%20Abuse%20Recovery2.png'),
                    Image.network(
                        'https://anchoredtidesrecovery.com/wp-content/uploads/2022/02/Parenting-Someone-with-a-Cocaine-Addiction1.jpg'),
                    Image.network(
                        'https://drugfreecountry.com/wp-content/uploads/2022/11/istockphoto-1380976736-612x612-1.jpg')
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewAppointmentPage()),
                    );
                  },
                  label: Text(
                    "Appointments",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.local_hospital),
                ),
              ],
            ),
            buildTimelineItem(
              title: 'Register',
              onPressed: () {

              },
              isFirst: true,
              icon: Icons.article,
              hasCheckbox: true,
              isChecked: isRegistered, // Pass checkbox state
            ),
            buildTimelineItem(
              title: 'Appointment',
              onPressed: () {
                setState(() {
                  appointmentChecked = !appointmentChecked; // Toggle checkbox state
                });
              },
              isFirst: false,
              icon: Icons.calendar_today,
              hasCheckbox: true,
              isChecked: appointmentChecked, // Initialize checkbox state
            ),
            buildTimelineItem(
              title: 'Admit',
              onPressed: () {
                setState(() {
                  admitChecked = !admitChecked; // Toggle checkbox state
                });
              },
              icon: Icons.local_hospital,
              hasCheckbox: true,
              isChecked: admitChecked, // Initialize checkbox state
            ),
            buildTimelineItem(
              title: 'Treatment',
              onPressed: () {
                setState(() {
                  treatmentChecked = !treatmentChecked; // Toggle checkbox state
                });
              },
              icon: Icons.healing,
              hasCheckbox: true,
              isChecked: treatmentChecked, // Initialize checkbox state
            ),
            buildTimelineItem(
              title: 'Release',
              onPressed: () {
                setState(() {
                  releaseChecked = !releaseChecked; // Toggle checkbox state
                });
              },
              icon: Icons.check_box,
              hasCheckbox: true,
              isChecked: releaseChecked, // Initialize checkbox state
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
  required bool isChecked, required bool hasCheckbox,
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
        trailing: Checkbox(
          activeColor: Colors.deepPurple,
          value: isChecked,
          onChanged: (newValue) {
            // Update the checkbox state when tapped
            // This function will be called when the checkbox is tapped
            // You should implement logic here to update the state
          },
        ),
      ),
    ],
  );
}
