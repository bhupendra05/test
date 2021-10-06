import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  handleSignIn(BuildContext context) async {
    var url = Uri.parse('https://devhouse.syscraftonline.net/eroar/api/login');

    final response = await http.post(url,
        body: json.encode({
          'user_email': email.text.toString(),
          'user_pass': pass.text.toString(),
        }),
        headers: {
          "Client-Service": "COAS2020SCP",
          "Auth-Key": "SYS5ccd7b534b19d30030c6503f3a852d00SCP",
          "Content-Type": "application/json",
        });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, "home");
    } else if (response.statusCode == 422) {
      final snackBar = SnackBar(content: Text('Password wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(content: Text('email and password is wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xff00b8a5),
                height: height * 0.45,
                width: width,
                padding: EdgeInsets.only(top: height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      height: height * 0.05,
                      width: width,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.1,
                      width: width,
                      child: Text(
                        "LOG IN",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: height * 0.04,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffd1d775),
                        borderRadius: BorderRadius.all(
                          Radius.circular(width * 0.2),
                        ),
                      ),
                      height: height * 0.01,
                      width: width * 0.2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.05,
                      width: width,
                      child: Text(
                        "Please Log in to your account",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: height * 0.07,
                            width: height * 0.07,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/colony.png"),
                              ),
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(height * 0.07),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: width * 0.024),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "DK0815",
                                  style: GoogleFonts.roboto(
                                    fontSize: height * 0.014,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                Text(
                                  "Horizon Estate Valley",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.017,
                                  ),
                                ),
                                Text(
                                  "Block 'A', M.G. Road",
                                  style: GoogleFonts.roboto(
                                    fontSize: height * 0.014,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: width * 0.024),
                            height: height * 0.04,
                            width: width * 0.18,
                            decoration: BoxDecoration(
                              color: Color(0xfff08c34),
                              borderRadius: BorderRadius.all(
                                Radius.circular(height * 0.07),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "CHANGE",
                                style: GoogleFonts.roboto(
                                  fontSize: width * 0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: height * 0.05),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(width * 0.02),
                        ),
                      ),
                      height: height * 0.13,
                      width: width * 0.9,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: "Enter your Email",
                          icon: Icon(
                            Icons.email,
                            color: Color(0xffF8DD6C),
                          ), //icon at head of input
                        )),
                    TextField(
                        controller: pass,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xffF8DD6C),
                          ), //icon at head of input
                          //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                          labelText: "Enter your Password",
                        )),
                    Container(
                      height: height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              handleSignIn(context);
                            },
                            child: Container(
//                          margin: EdgeInsets.only(top: height * 0.034),
                              height: height * 0.07,
                              width: width * 0.88,
                              decoration: BoxDecoration(
                                color: Color(0xfff08c34),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(height * 0.07),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "LOG IN",
                                  style: GoogleFonts.roboto(
                                    fontSize: width * 0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width,
                            child: Text(
                              "Forgot Your Password?",
                              style: GoogleFonts.roboto(
                                color: Color(0xFF747474),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff00B8A5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(width * 0.2),
                              ),
                            ),
                            height: height * 0.01,
                            width: width * 0.17,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Not a Member? ",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF747474),
                                  ),
                                ),
                                Text(
                                  "Sign up",
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF747474),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
