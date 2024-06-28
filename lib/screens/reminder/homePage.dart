import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'notificationssss.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TimeDisplay(), // Display time in the app bar
          ),
        ],
      ),
      body: const NotificationPage(), // Example body content
    );
  }
}

class TimeDisplay extends StatefulWidget {
  const TimeDisplay({Key? key}) : super(key: key);

  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late Stream<DateTime> _clockStream;
  late DateFormat _timeFormatter;

  @override
  void initState() {
    super.initState();
    // Initialize the stream with a timer that ticks every second
    _clockStream =
        Stream<DateTime>.periodic(const Duration(seconds: 1), (count) {
      return DateTime.now();
    });

    // Initialize the time formatter
    _timeFormatter =
        DateFormat.Hm(); // Hm for 24-hour format, hh:mm a for 12-hour format
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _clockStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime currentTime = snapshot.data!;
          String formattedTime = _timeFormatter.format(currentTime);

          return Text(
            formattedTime,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Text('Loading...'); // Placeholder widget if no data
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
