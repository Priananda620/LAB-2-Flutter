// ignore_for_file: prefer_is_empty, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('priananda'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
        elevation: 0,
      ),
      body: SizedBox(
          height: screenHeight - keyboardHeight,
          child: Container(
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
              )))),
    );
  }
}

class RegisterRoute extends StatelessWidget {
  var _image;
  final TextEditingController _emailRegisCOntroller = TextEditingController();
  final TextEditingController _usernameRegisController =
      TextEditingController();
  final TextEditingController _phoneRegisController = TextEditingController();
  final TextEditingController _addressRegisController = TextEditingController();

  final TextEditingController _passwordRegisController =
      TextEditingController();
  final TextEditingController _password2RegisController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void dispose() {
    _emailRegisCOntroller.dispose();
    _usernameRegisController.dispose();
    _phoneRegisController.dispose();
    _addressRegisController.dispose();
    _passwordRegisController.dispose();
    _password2RegisController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to MyTutor",
        theme: ThemeData().copyWith(
            // scaffoldBackgroundColor: Colors.green,
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: hexToColor("#F64C72"))),
        // ignore: unnecessary_new
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: new SizedBox(
                height: (screenHeight - keyboardHeight),
                child: new Container(
                    color: Color.fromARGB(255, 43, 43, 43),
                    child: new Container(
                      child: new Center(
                          child: new SingleChildScrollView(
                              physics: ClampingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: new Column(children: [
                                new Padding(
                                    padding: EdgeInsets.only(top: 100.0)),
                                new Text(
                                  'Sign Up',
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa"),
                                      fontSize: 25.0),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _emailRegisCOntroller,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Email",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _usernameRegisController,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Username",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.account_box,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _phoneRegisController,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Phone",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _addressRegisController,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Address",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.home,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 4,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                // new TextFormField(
                                //   decoration: new InputDecoration(
                                //     labelText: "Profile Picture",
                                //     labelStyle:
                                //         TextStyle(color: hexToColor("#eef5fa")),
                                //     prefixIcon: Icon(
                                //       Icons.image,
                                //       color: hexToColor("#F64C72"),
                                //     ),
                                //     fillColor: hexToColor("#1d1d1d"),
                                //     filled: true,
                                //     border: new OutlineInputBorder(
                                //       borderRadius:
                                //           new BorderRadius.circular(10.0),
                                //       borderSide: new BorderSide(),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       borderSide: BorderSide(
                                //           color: hexToColor("#eef5fa"),
                                //           width: 1.5),
                                //     ),
                                //     // enabledBorder: OutlineInputBorder(
                                //     //   borderRadius: BorderRadius.circular(10.0),
                                //     //   borderSide: BorderSide(
                                //     //       color: hexToColor("#eef5fa"), width: 0),
                                //     // ),
                                //     //fillColor: Colors.green
                                //   ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please enter valid product name';
                                //     }
                                //     return null;
                                //   },
                                //   keyboardType: TextInputType.emailAddress,
                                //   style: new TextStyle(
                                //       color: hexToColor("#eef5fa")),
                                // ),
                                ElevatedButton(
                                  onPressed: () {
                                    _getFromGallery();
                                  },
                                  child: Text(
                                    'Upload Image',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 238, 245, 250),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  //style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 168),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _passwordRegisController,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    labelText: "Enter Password",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.security,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                new TextFormField(
                                  controller: _password2RegisController,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle:
                                        TextStyle(color: hexToColor("#eef5fa")),
                                    prefixIcon: Icon(
                                      Icons.security,
                                      color: hexToColor("#F64C72"),
                                    ),
                                    fillColor: hexToColor("#1d1d1d"),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: hexToColor("#eef5fa"),
                                          width: 1.5),
                                    ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   borderSide: BorderSide(
                                    //       color: hexToColor("#eef5fa"), width: 0),
                                    // ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter valid product name';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  style: new TextStyle(
                                      color: hexToColor("#eef5fa")),
                                ),
                                new Padding(
                                    padding: EdgeInsets.only(top: 35.0)),
                                //////////
                                ////////////
                                /////////////
                                /////////////
                                ///////////////
                                //////////////////////////////
                                ////////////////////////////////////////
                                ///////////////////////////////////////////////////
                                ElevatedButton(
                                  onPressed: () async {
                                    _insertProduct();
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 238, 245, 250),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  //style: new TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),),
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 0, 0, 168),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]))),
                    )))));
  }

  void _insertProduct() {
    String _email = _emailRegisCOntroller.text;
    String _username = _usernameRegisController.text;
    String _phone = _phoneRegisController.text;
    String _address = _addressRegisController.text;
    String _pass = _passwordRegisController.text;
    String _pass2 = _password2RegisController.text;

    String base64Image = base64Encode(_image!.readAsBytesSync());
    // String base64Image = base64Encode(_image!.readAsBytesSync());
    // print(base64Image);
    http.post(
        Uri.parse("http://10.19.88.204:8080/CONTINUOUSPROJ/api/register.php"),
        body: {
          "name": _prname,
          "desc": _prdesc,
          "price": _prprice,
          "qty": _prqty,
          "barcode": _prbarcode,
          "type": dropdownvalue,
          "image": base64Image,
        }).then((response) {
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(
            msg: data['status'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    });
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
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
                        prefixIcon: Icon(
                          Icons.email,
                          color: hexToColor("#F64C72"),
                        ),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid product name';
                        }
                        return null;
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid product name';
                        }
                        return null;
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
