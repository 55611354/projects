import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text("logo"),
              Text("apptitle"),
              Text("placeholder"),
              Text("placeholder 2"),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CookieContainer(),
          ],
        ),
      ),
    );
  }
}

class Cookie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.brown,
      ),
    );
  }
}

class CookieCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("placeholder.cookieCount Cookies");
  }
}

class CookieContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("placeholder.cookieCount Cookies"),
        Cookie(),
      ]),
    );
  }
}

class ShopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("placeholder"),
      ],
    );
  }
}



class ShopOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin:EdgeInsetsDirectional.only(start: 3, end:3, top:5, bottom: 5, ),
      child: Row(


      ),
    );
  }
}

class ShopItemIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.brown, width: 4,),
      ),
    ));
  }
}