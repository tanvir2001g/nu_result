import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'NU Result 2020';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: MainPage(title: title),
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: ListView(
      padding: const EdgeInsets.all(32),
      children: [
        buildHello1(),
        const SizedBox(height: 24),
        buildWebsiteLink(),
      ],
    ),
  );

  Widget buildHello1() => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'সবার জন্য শুভ কামনা রইল',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 50,
          ),
        ),
        TextSpan(
          text: ' \n \n তানভীর হাসান',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ],
    ),
  );




  Widget buildWebsiteLink() => RichText(
    text: TextSpan(
      text: 'NU Result link ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      children: [
        TextSpan(
          text: 'CLICK HERE',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = launchWebsite,
        ),
      ],
    ),
  );


  Future launchWebsite() async {
    const url = 'http://results.nu.ac.bd/';

    await launch(url);
  }


}
