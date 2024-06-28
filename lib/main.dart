import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/reminder/homePage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'screens/addDocument.dart';
import 'screens/add_screen.dart';
import 'screens/reminder/global.dart';
import 'screens/start_screen.dart';

Future<void> requestNotificationPermission() async {
  var status = await Permission.notification.request();
  if (!status.isGranted) {
    // Handle permission not granted
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize notification permissions
  await requestNotificationPermission();

  runApp(ZEE());
}

// void main() {
//   runApp(ZEE());
// }

class ZEE extends StatefulWidget {
  @override
  State<ZEE> createState() => _ZEEState();
}

class _ZEEState extends State<ZEE> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              'LoginScreen': (context) => LoginScreen(),
              'RegisterScreen': (context) => RegisterScreen(),
              'StartScreen': (context) => StartScreen(),
              AddScreen.routeName: (context) => AddScreen(),
              'AddDocument': (context) => AddDocument(),
            },
            initialRoute: 'StartScreen',
            
          );
        },
      ),
    );
  }
  /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        'RegisterScreen': (context) => RegisterScreen(),
        'StartScreen': (context) => StartScreen(),
        AddScreen.routeName: (context) => AddScreen(),
        'AddDocument': (context) => AddDocument(),
      },
      //initialRoute: 'StartScreen',
      home: HomePage(),
    );
  }*/
}
