// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, unnecessary_this

import 'dart:ui';


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// Startseite
class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  static var appBarKey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(key: appBarKey),
          body: LoginMask(),
       ),
    );
  }
}

class LoginMask extends StatefulWidget {
  @override
  _LoginMaskState createState() => _LoginMaskState();
}
class _LoginMaskState extends State<LoginMask> {
  late String _username;
  late String _password;
  late String _abteilung;
  late bool _canLogin;
  late String _headline;

    
  @override
  void initState() {
    super.initState();
    _username = '';
    _password = '';
    _abteilung = '';
    _canLogin = false;
    _headline = 'Willkommen';
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 20),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Baseline(baseline: -30, baselineType: TextBaseline.alphabetic,
            child: Text('Bitte geben Sie ihre Logindaten ein'),
            ),
            Text(_headline),
            TextField(onSubmitted: _onSubmittedUsername),
            Baseline(baseline: -5, baselineType: TextBaseline.alphabetic,
            child: Text('Benutzername'),
            ),
            TextField(onSubmitted: _onSubmittedPassword),
            Baseline(baseline: -5, baselineType: TextBaseline.alphabetic,
            child: Text('Passwort'),
            ),
            TextField(onSubmitted: _onSubmittedabteilung),
            Baseline(baseline: -5, baselineType: TextBaseline.alphabetic,
            child: Text('Abteilung'),
            ),
            ElevatedButton(
              onPressed: _canLogin? () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              }: null,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Registrieren()));
              },
              child: Text('Registrieren'),
            ),
          ],
        ),
      ),
          );
  }
  void _onSubmittedUsername(String username) {
    _username = username;
    _checkCanLogin();
  }
  void _onSubmittedPassword(String password) {
    _password = password;
    _checkCanLogin();
  }
  void _onSubmittedabteilung(String abteilung) {
    _abteilung = abteilung;
    _checkCanLogin();
  }
  
  void _checkCanLogin() {
    setState(() {
      _canLogin = _username.isNotEmpty && _password.isNotEmpty && _abteilung.isNotEmpty;
    });
  }
}



// Registrieren Seite
class Registrieren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 100),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Registrieren, kommt noch weg, nur für den Überblick noch hier',
              style: TextStyle(color: Colors.yellowAccent),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text('Zurück zu Login'),
            ),
          ],
        ),
      );
  }
}




// Home Seite
class Home extends StatelessWidget {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(0, 191, 255, 100),
     body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
            SizedBox(
              width: 80,
              height: 100,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Menu()));
                  },
                ),
            ),

            SizedBox(
            width: 100,
            height: 120,
             child: Image(
              image: AssetImage(
              'assets/images/Pbs.png',)
                ),
            ),
            ],
          ),
          
          
            

          Flexible(
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Text('Willkommen auf (Name der App). Hier kannst du deine Übungen von der Pfadi, sei es vom Sommerlager oder von einem Samstagnachmittag hochladen und mit anderen Pfadis teilen.', 
              style: TextStyle(color: Colors.yellowAccent, fontSize: 17),
              ),
            ),
          ),

          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: Text('                  '),
            ),
          ),

          SizedBox(
            height: 80,
            child: Text('          '),
          ),
          

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/Geländegame.jpg',)
                ),
              ),
            
              SizedBox(
                width: 200,
                height: 200,
                child: Image(
                  image: AssetImage('assets/images/Geländegame2.jpg',)
                ),
              ),
              
              
            ],
          ),
            

          ],
        ), 
    );
  }
}


// Menu Seite
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  height: 70,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu_open,
                      color: Colors.grey,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ),

                SizedBox(
                  width: 100,
                  height: 120,
                  child: Image(
                    image: AssetImage(
                      'assets/images/Pbs.png',)
                  ),
                ),
              ],
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hochladen()));
                    },
                    child: Text('Hochladen',
                    style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [         
                SizedBox(
                  width: 80,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Suchen()));
                    },
                    child: Text('Suchen',
                    style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ),
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Einstellungen()));
                    },
                    child: Text('Einstellungen',
                    style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text('Ausloggen',
                    style: TextStyle(color: Colors.yellowAccent),
                    ),
                  ),
                ),
              ],
            ),

         ],
        ),
    );
  }
}


// Hochladen Seite
class Hochladen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 70,
                child: IconButton(
                   icon: Icon(
                     Icons.menu,
                     color: Colors.grey,
                     size: 50,
                   ),
                   onPressed: () {
                     Navigator.of(context)
                     .push(MaterialPageRoute(builder: (context) => Menu()));
                   },
                ),
              ),
              
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'assets/images/Pbs.png',)
                ),
              ),
            ],
          ),

        Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              child: Text('Hallo, hier sollte nun ganzzzzzzzzzzzzzz viel platz sein zum schreibne, oder so hoofenjhtgjsadkjjfsdkjföa kasjdfklsd f ,asdfk jskdfjaikaöksldjföasf. ksdjfkdsjf ölsdflk',
                style: TextStyle(fontSize: 15, backgroundColor: Colors.lightBlue, color: Colors.yellow),
              ),
            ),
        ),
        ],
      ),
    );
  }
}


// Suchen Seite
class Suchen extends StatelessWidget {
  var Stufe = ['Wölfe', 'Pfadi', 'Pio'];
  var Dauer = ['1-3h', '3-6h', '6+ h'];
  var Jahreszeit = ['Frühling', 'Sommer', 'Herbst', 'Winter'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(139, 34, 82, 100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 70,
                child: IconButton(
                   icon: Icon(
                     Icons.menu,
                     color: Colors.grey,
                     size: 50,
                   ),
                   onPressed: () {
                     Navigator.of(context)
                     .push(MaterialPageRoute(builder: (context) => Menu()));
                   },
                ),
              ),
            Flexible(
              child: FractionallySizedBox(
              widthFactor: 0.7,
                child: Baseline(baseline: 10, baselineType: TextBaseline.alphabetic,
                  child: Text('Übung suchen',
                  style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
                  ),
                ),
              ),
            ),
                          
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'assets/images/Pbs.png',)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Stufe',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Dauer',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Baseline(baseline: -10, baselineType: TextBaseline.alphabetic,
                  child: Text('Jahreszeit',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Stufe.map((buildMenuItem)).toList(),
                    onChanged: (value) => setState (() => this.value = value),
                    dropdownColor: Colors.lightBlue,
                    iconEnabledColor: Colors.black87,
                    ),
                  ),
                ), 
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    value: value,
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Dauer.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                    dropdownColor: Colors.lightBlue,
                    iconEnabledColor: Colors.black87,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                widthFactor: 0.9,
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                    value: value,
                    iconSize: 25,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded, color: Colors.black,
                      ),
                    isExpanded: true,
                    items: Jahreszeit.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                    dropdownColor: Colors.lightBlue,
                    iconEnabledColor: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
         
        ],     
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item, 
      style: TextStyle(fontSize: 20),
      ),
  );
  setState(String? Function() param0) {}
}


// Einstellungen Seite
class Einstellungen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(139, 34, 82, 100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 70,
                child: IconButton(
                   icon: Icon(
                     Icons.menu,
                     color: Colors.grey,
                     size: 50,
                   ),
                   onPressed: () {
                     Navigator.of(context)
                     .push(MaterialPageRoute(builder: (context) => Menu()));
                   },
                ),
              ),
              
              SizedBox(
                width: 100,
                height: 120,
                child: Image(
                  image: AssetImage(
                    'assets/images/Pbs.png',)
                ),
              ),
            ],
          ),

    
        ],
      ),
    );
  }
}


