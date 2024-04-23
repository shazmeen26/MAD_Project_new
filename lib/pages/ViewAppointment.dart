import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(ViewAppointment());
}

class ViewAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Timeline'),
        backgroundColor: Colors.deepPurple, // Updated app bar color
      ),
      body: ListView(
        children: [
          Card(child: Image.network('https://assets-global.website-files.com/6092dc6b87cb4a214c3c2dde/643e7a0383dc9168d6279198_Fighting%20Drug%20Addiction%20By%20Taking%20Help%20From%20Best%20Rehab%20Centers.png'),),

          _buildTimelineItem(
            title: 'Register',
            onPressed: () {
              // Action for Register
            },
            isFirst: true,
            icon: Icons.article,
            hasCheckbox: true,
          ),
          _buildTimelineItem(
            title: 'Appointment',
            onPressed: () {
              // Action for Appointment
            },
            icon: Icons.calendar_today,
            hasCheckbox: true,
          ),
          _buildTimelineItem(
            title: 'Admit',
            onPressed: () {
              // Action for Admit
            },
            icon: Icons.local_hospital,
            hasCheckbox: true,
          ),
          _buildTimelineItem(
            title: 'Treatment',
            onPressed: () {
              // Action for Treatment
            },
            icon: Icons.healing,
            hasCheckbox: true,
          ),
          _buildTimelineItem(
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
    );
  }

  Widget _buildTimelineItem({
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
              child:  Icon(icon, color: Colors.white, size: 20)
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
}