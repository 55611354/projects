import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

var stats = Stats();

class Stats {
  num cookiesOwned = 0;
  num cookiesPerClick = 1;
  void makeCookies() {
    cookiesOwned += cookiesPerClick;
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
        flexibleSpace: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
            CookieContainer(),
            ShopMenu(),
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
      margin: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.brown,
      ),
    );
  }
}

class CookieCount extends StatefulWidget {
  const CookieCount({super.key});
  @override
  State<CookieCount> createState() => CookieCountState();
}

class CookieCountState extends State<CookieCount> {
  @override
  Widget build(BuildContext context) {
    return Text("${(stats.cookiesOwned.round().toString())} Cookies");
  }
}

class CookieContainer extends StatefulWidget {
  const CookieContainer({super.key});

  @override
  State<CookieContainer> createState() => _CookieContainerState();
}

class _CookieContainerState extends State<CookieContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CookieCount(),
        GestureDetector(
          child: Cookie(),
          onTap: () => setState(() {
            stats.makeCookies();
          }),
        ),
      ]),
    );
  }
}

class ShopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        ShopOption(
          setName: "first upgrade",
          setDescription: "The first upgrade you can buy",
          setCost: 100,
        ),
        ShopOption(
          setName: "second upgrade",
          setDescription: "Ahhhhh",
          setCost: 500,
        ),
        ShopOption(
          setName: "third upgrade",
          setDescription: "<--- woah no picture ",
          setCost: 1000,
        ),
//////////////////////////////
//CREATE A NEW ShopOption() WIDGET HERE








//////////////////////
      ],
    ));
  }
}

class ShopOption extends StatefulWidget {
  String? name;
  String? description;
  int numberOf = 0;
  num? cost;
  ShopOption(
      {String? imageId,
      required String? setName,
      required String? setDescription,
      num? setCost}) {
    name = setName ?? "name";
    description = setDescription ?? 'description';
    cost = setCost ?? -1;
  }
  @override
  State<ShopOption> createState() => _ShopOptionState(setName: name, setDescription: description, setCost: cost);
}

class _ShopOptionState extends State<ShopOption> {
  String? name;
  String? description;
  int numberOf = 0;
  num cost = -1;
  _ShopOptionState(
      {String? imageId,
      required String? setName,
      required String? setDescription,
      required setCost}) {
    name = setName ?? "name";
    description = setDescription ?? 'description';
    cost = setCost ?? -1;
  }

  void buyUpgrade(){
    if (stats.cookiesOwned >= num.parse("$cost")){
      setState(() {
        stats.cookiesOwned -= num.parse("$cost"); 
        stats.cookiesPerClick += num.parse("$cost") * .01;
        ++numberOf;
        cost = cost * 1.05;
        cost = cost.round();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buyUpgrade(),
        child: Container(
      height: 100,
      width: 100,
      margin: const EdgeInsetsDirectional.only(
        start: 3,
        end: 3,
        top: 5,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(
          color: const Color.fromARGB(255, 122, 17, 17),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShopItemIcon(),
          Expanded(
              child: ShopItemDetails(
            setNumberOf: numberOf,
            setName: name,
            setCost: cost,
            setDescription: description,
          ))
        ],
      ),
    ));
  }
}

class ShopItemIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.brown,
          width: 4,
        ),
      ),
    );
  }
}

class ShopItemDetails extends StatelessWidget {
  String? name;
  String? description;
  int? numberOf;
  num? cost;
  ShopItemDetails(
      {required setNumberOf,
      required String? setName,
      required String? setDescription,
      required num? setCost}) {
    name = setName ?? "name";
    description = setDescription ?? 'description';
    cost = setCost ?? -1;
    numberOf = setNumberOf;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$name"),
              Text("$description"),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("own: $numberOf"),
              Text("$cost Cookies"),
            ],
          ),
        ),
      ],
    );
  }
}
