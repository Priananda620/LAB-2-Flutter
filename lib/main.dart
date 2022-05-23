// ignore_for_file: prefer_is_empty, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/login': (context) => LoginRoute(),
      '/register': (context) => RegisterRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('priananda'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
        elevation: 0,
      ),
      body: Container(
          color: Color.fromARGB(255, 29, 29, 29),
          child: Center(
              child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 40.0)),
              Center(
                child: Row(children: [
                  Container(child: Image.asset('assets/logo/logo48.png')),
                  Text(
                    "My Tutor",
                    style: GoogleFonts.chivo(
                      textStyle: TextStyle(
                          fontSize: 38,
                          color: Color.fromARGB(255, 238, 245, 250),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ], mainAxisAlignment: MainAxisAlignment.center),
              ),
              Divider(
                height: 40.0,
              ),
              Container(
                child: Image.asset(
                    'assets/flat_illustration/undraw_work_time_re_hdyv.png'),
              ),
              new Padding(padding: EdgeInsets.only(top: 40.0)),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 238, 245, 250),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 0, 168),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    new Padding(padding: EdgeInsets.only(right: 10.0)),
                    ElevatedButton(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 238, 245, 250),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 0, 168),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ],
                )),
              )
            ],
          ))),
    );
  }
}

class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to MyTutor",
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: Colors.green,
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: hexToColor("#F64C72"))),
        // ignore: unnecessary_new
        home: new Material(
            child: new Container(
                padding: const EdgeInsets.all(20.0),
                color: Color.fromARGB(255, 43, 43, 43),
                child: new Container(
                  child: new Center(
                      child: new SingleChildScrollView(
                          child: new Column(children: [
                    new Padding(padding: EdgeInsets.only(top: 100.0)),
                    new Text(
                      'Sign Up',
                      style: new TextStyle(
                          color: hexToColor("#eef5fa"), fontSize: 25.0),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Email",
                        labelStyle: TextStyle(color: hexToColor("#eef5fa")),
                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.orange,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: hexToColor("#eef5fa"),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: hexToColor("#eef5fa"),
                            width: 2.0,
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Username",
                        prefixIcon: Icon(Icons.person_add),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Username cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Phone",
                        prefixIcon: Icon(Icons.phone),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Phone cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: "Enter Address",
                        prefixIcon: Icon(Icons.house),

                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Address cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.visiblePassword,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: "Profile Picture",
                        prefixIcon: Icon(Icons.image),

                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Profile Picture cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.visiblePassword,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        prefixIcon: Icon(Icons.security),

                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.visiblePassword,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.security),

                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.visiblePassword,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    // ElevatedButton(
                    //   child: Text(
                    //     'Sign Up',
                    //     style: GoogleFonts.montserrat(
                    //       textStyle: TextStyle(
                    //           fontSize: 20,
                    //           color: Color.fromARGB(255, 238, 245, 250),
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/register');
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Color.fromARGB(255, 0, 0, 168),
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 30, vertical: 10),
                    //       textStyle: TextStyle(
                    //           fontSize: 30, fontWeight: FontWeight.bold)),
                    // ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 238, 245, 250),
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      //style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 0, 168),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ]))),
                ))));
  }
}

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to Flutter",
        home: new Material(
            child: new Container(
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(children: [
                    new Padding(padding: EdgeInsets.only(top: 140.0)),
                    new Text(
                      'Log In',
                      style: new TextStyle(
                          color: hexToColor("#F2A03D"), fontSize: 25.0),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Email",
                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        prefixIcon: Icon(Icons.security),

                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val!.length == 0) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.visiblePassword,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 35.0)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Log In'),
                      //style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orangeAccent[100],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ])),
                ))));
  }
}
