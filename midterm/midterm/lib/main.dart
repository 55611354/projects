import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


var stats =  CookieStats();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class CookieStats {
  num _cookies = 0;
  num get cookieCount {
    return _cookies;
  }
  set cookieCount (num cookie) {
    setState(
      () => _cookies += cookie
      );
  }

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        flexibleSpace: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("logo"),
              Text("apptitle"),
              Text("placeholder"),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$stats.cookieCount Cookies"),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown,
                    ),
                  ),
                ]
              ),
            ),
            Column(children:[Text("placeholder"),],),
          ],
        ),
      ),
    );
  } 
 State<MainMenu> createState() => increment();
}

class increment extends State<MainMenu>{
  setState(() => stats.cookieCount++);
}


class TestThing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("placeholder");

  }
}