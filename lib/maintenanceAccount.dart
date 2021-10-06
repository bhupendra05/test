import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceAccount extends StatefulWidget {
  const MaintenanceAccount({Key? key}) : super(key: key);

  @override
  _MaintenanceAccountState createState() => _MaintenanceAccountState();
}

class _MaintenanceAccountState extends State<MaintenanceAccount> {
  List _products = [];
  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  Future<void> readJsonFile() async {
    final String res =
        await rootBundle.loadString('assets/products-small.json');
    final productsData = await json.decode(res);
    setState(() {
      _products = productsData['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B8A5),
        title: Text("Maintenance Account"),
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.1,
            color: Color(0xff200854),
            child: Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                Text(
                  "₹9,240/- Maintenance Charges Due",
                  style: GoogleFonts.roboto(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.024),
                  height: height * 0.04,
                  width: width * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xfff08c34),
                    borderRadius: BorderRadius.all(
                      Radius.circular(height * 0.07),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAY NOW",
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
          ),
          if (_products.length > 0)
            Expanded(
              child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 30,
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.01,
                              width: width * 0.91,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                                color: Color(0xffF8DD6C),
                              ),
                            ),
                            Container(
                              height: height * 0.09,
                              width: width * 0.92,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: Color(0xffF8DD6C),
                                  ),
                                  SizedBox(
                                    width: width * 0.05,
                                  ),
                                  Text(_products[index]['date']),
                                  SizedBox(
                                    width: width * 0.15,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: width * 0.024),
                                    height: height * 0.04,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Color(0xff200854),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(height * 0.07),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Due ₹${_products[index]['Due']}",
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
                            ),
                            SizedBox(
                              height: height * 0.007,
                            ),
                            Container(
                              width: width * 0.9,
                              height: height * 0.001,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Monthly Maintainance Charges",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.03),
                                  ),
                                  Text(
                                      "₹${_products[index]['Monthly maintainance Charges']}"),
                                ],
                              ),
                            ),
                            if (_products[index]['lift Repairing charges'] !=
                                "")
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lift Repairing charges",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: width * 0.03),
                                    ),
                                    Text(
                                        "₹${_products[index]['lift Repairing charges']}"),
                                  ],
                                ),
                              ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Old Due",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.03),
                                  ),
                                  Text("₹${_products[index]['Old Due']}"),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Charges",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.035),
                                  ),
                                  Text(
                                    "₹${_products[index]['Total Charges']}",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Container(
                              width: width * 0.8,
                              height: height * 0.001,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            if (_products[index]['Receipt'] != "")
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: height * 0.03,
                                        width: height * 0.03,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/tick.png"),
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(height * 0.07),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: width * 0.0009),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Receipt #${_products[index]['Receipt']}",
                                              style: GoogleFonts.roboto(
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.009,
                                            ),
                                            Text(
                                              "Paid ₹${_products[index]['Paid']}",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.017,
                                              ),
                                            ),
                                            Text(
                                              "${_products[index]['Time']}",
                                              style: GoogleFonts.roboto(
                                                fontSize: height * 0.014,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: width * 0.024),
                                        height: height * 0.04,
                                        width: width * 0.18,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/Receipt.png"),
                                          ),
                                          color: Color(0xfff08c34),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(height * 0.07),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ));
                  }),
            )
          else
            (Container(
              child: Text("Click to load products"),
            )),
        ],
      ),
    );
  }
}
