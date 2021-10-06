import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var choices = [
      'Maintenance Account',
      'Society Management',
      'Notice Board',
      'Society Rules',
      'Group messages',
      'Notifications'
    ];
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: height * 0.01),
            height: height * 0.1,
            color: Color(0xff00B8A5),
            // margin: EdgeInsets.only(top: height * 0.06),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: width * 0.05,
                ),
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Text(
                  "Horizon Estate Valley",
                  style: GoogleFonts.roboto(
                    color: Color(0xffffffff),
                  ),
                ),
                SizedBox(
                  width: width * 0.3,
                ),
                Icon(
                  Icons.person,
                  color: Color(0xFFffffff),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.25,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff7bd5cc),
              image: DecorationImage(
                image: AssetImage('assets/images/bgimg.png'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.14,
                  width: width * 0.9,
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.07,
                        width: height * 0.07,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/user.png"),
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
                            SizedBox(
                              height: height * 0.009,
                            ),
                            Text(
                              "Abhishek Kumar Rawant",
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
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(width * 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              color: Color(0xffF1F2F2),
              height: height * 0.65,
              width: width,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    return Center(
                      child: SelectCard(choice: choices[index], index: index),
                    );
                  })))
        ]),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({this.choice, this.index});
  final choice;
  final index;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '$choice');
      },
      child: Card(
        color: Color(0xffffffff),
        child: Container(
          width: width * 0.4,
          height: height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(width * 0.2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/$choice.png"),
                  fit: BoxFit.fitWidth,
                ),
                width: height * 0.1,
                height: height * 0.1,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: (index == 1 || index == 2 || index == 5)
                        ? Color(0xff9B7EEC)
                        : Color(0xff00b8a5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(height * 0.1),
                    ),
                    border: Border.all(
                        color: (index == 1 || index == 2 || index == 5)
                            ? Color(0xffd7cbf7)
                            : Color(0xff7bd5cc),
                        width: 10)),
              ),
              Container(
                child: Text("$choice"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
