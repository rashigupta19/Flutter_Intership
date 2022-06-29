import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fourthtask_local_notification/widgets/Text_Field.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tc = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings("@mipmap/ic_launcher");
    var initSettings = new InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: selectNotification);
    super.initState();
  }

  selectNotification(String? payload) async {
    debugPrint("payload : $payload");
    await showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Notification Text"),
          content: Text("Message : $payload"),
        );
      },
    );
  }

  Future _showNotificationWithSound() async {
    var androidPlatformChannelSpecifics =
        new AndroidNotificationDetails('your channel id', 'your channel name');

    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'Click on the Notification',
      platformChannelSpecifics,
      payload: '${tc.text}',
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications")),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextBox("Message", tc, deviceSize),
          ElevatedButton(
            onPressed: () {
              _showNotificationWithSound();
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 8, 84, 217)),
            child: const Text(
              'SUBMIT',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          )
        ],
      ),
    );
  }
}
