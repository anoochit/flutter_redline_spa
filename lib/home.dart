import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:flutter_redline_web2/widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenType = checkScreenSize(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        title: Center(
          child: Container(
            width: 1024,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "redlinesoft",
                      style: GoogleFonts.pacifico(fontSize: 28, color: Colors.black),
                    )),
                Spacer(),
                (screenType == "mobile")
                    ? Container()
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: [
                              for (int i = 0; i < listMenu.length; i++)
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      listMenu[i],
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  onTap: () {
                                    log('tab menu index = ' + i.toString());
                                    scrollTo(listPagePosition[i]);
                                    setState(() {
                                      index = i;
                                    });
                                  },
                                ),
                            ],
                          );
                        },
                      ),
                ElevatedButton(
                  child: Text("Quotation"),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () async {
                    var url = "https://forms.gle/FzyueDBfHDvhh9EF6";
                    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
                  },
                )
              ],
            ),
          ),
        ),
        actions: (screenType == "mobile")
            ? [
                PopupMenuButton(
                    enabled: true,
                    onSelected: (value) {
                      scrollTo(listPagePosition[int.parse(value.toString())]);
                      setState(() {
                        index = int.parse(value.toString());
                      });
                    },
                    itemBuilder: (context) {
                      return listMenu.map((choice) {
                        return PopupMenuItem(
                          value: int.parse(listMenu.indexOf(choice).toString()),
                          child: Text("$choice"),
                        );
                      }).toList();
                    })
              ]
            : [],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            controller: scrollController,
            child: Center(
              child: Column(
                children: [
                  // jumbotail
                  SizedBox(height: 32),
                  // service section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      "\"We turn ideas into a product\"",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: 64),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Image.asset("assets/images/undraw_programming_2svr.png"),
                  ),
                  SizedBox(height: 64),

                  // service section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      "Our Services",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),

                  // web app service
                  Wrap(
                    children: [
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/undraw_Website_builder_re_ii6e.png'),
                        ),
                      ),
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Web application development",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Modern web applications are easily accessible from any device. Users do not need to install applications. It also supports new technologies such as Push notification if you want to develop modern web applications. We can develop it for you.",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              // child: Text(
                              //   "เว็บแอปพลิเคชั่นยุคใหม่สามารถเข้าถึงได้ง่ายจากทุกอุปกรณ์ ผู้ใช้ไม่จำเป็นต้องติดตั้งแอพลิเคชั่น พร้อมรองรับเทคโนโลยีใหม่ๆ เช่น Push notification ได้ หากคุณต้องการพัฒนาเว็บแอปพลิเคชั่นยุคใหม่ เราสามารถพัฒนาให้คุณได้",
                              //   style: Theme.of(context).textTheme.headline6,
                              // ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 64),

                  // mobile app service
                  Wrap(
                    children: [
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Mobile application development",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Mobile and tablet applications Make it easy for users to access your services. We develop applications with technology like Flutter to support all platforms. It can also connect to cloud services.",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/undraw_mobile_web_2g8b.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),

                  // dApp app service
                  Wrap(
                    children: [
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/undraw_Ethereum_re_0m68.png'),
                        ),
                      ),
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "De-Centralized application development",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Blockchain technology does not stop at the world of finance and banking such as Crypto Currency, DeFi only. We can apply Blockchain technology in other fields such as NFT, Voting, Digital Token and etc. We are ready to help you step into the technology of this future.",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 64),

                  // portfolio section
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 32.0),
                  //   child: Text(
                  //     "Portfolio",
                  //     style: Theme.of(context).textTheme.headline3,
                  //   ),
                  // ),

                  // Container(
                  //   width: fixWidth * 1.0,
                  //   height: 200,
                  //   child: Expanded(
                  //     child: ListView(
                  //       scrollDirection: Axis.horizontal,
                  //       children: [
                  //         for (int i = 0; i < listPortfolio.length; i++)
                  //           Padding(
                  //             padding: const EdgeInsets.all(16.0),
                  //             child: Column(
                  //               children: [
                  //                 Image.asset(listPortfolio[i].image, width: 120),
                  //                 Text(
                  //                   listPortfolio[i].title,
                  //                   style: Theme.of(context).textTheme.headline6,
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // opensource section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      "Open Source Projects",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),

                  // opensource service
                  Wrap(
                    children: [
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Open Source Projects",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "In addition to developing products for customers We have an open source project that is open to interested developers to implement and develop additional new features.",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/undraw_open_source_1qxw.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),

                  // contact section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Text(
                      "Contact Us",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),

                  // contact
                  Wrap(
                    children: [
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/undraw_Messaging_fun_re_vic9.png'),
                        ),
                      ),
                      Container(
                        width: fixWidth / 2,
                        height: fixWidth / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "RedLine Software",
                                style: GoogleFonts.pacifico(textStyle: Theme.of(context).textTheme.headline4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "107 Moo 10, Suranaree, Muang, Nakhon-Ratchasima 30000",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Tel: 063 845 6070",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Email: info@redlinesoft.net",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void scrollTo(double index) {
    //scrollController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    scrollController.animateTo(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

// data
List<String> listMenu = [
  "Home",
  "Services",
  //"Portfolio",
  "OpenSource",
  "Contact",
];

class Service {
  final String title;
  final String image;

  Service(this.title, this.image);
}

var listPortfolio = [
  Service("Zeal IoT", "assets/images/logo_zeal.png"),
  Service("NutPed", "assets/images/logo_nutped.png"),
  Service("Blockchain ", "assets/images/logo_zeal.png"),
];

TextStyle kLogoText = GoogleFonts.pacifico(fontSize: 28, color: Colors.black);

int fixWidth = 960;

List<double> listPagePosition = [0, 800, (2150), (850 * 3)];

// utils
String checkScreenSize(BuildContext context) {
  var scWidth = MediaQuery.of(context).size.width;

  log(scWidth.toString());

  if (scWidth < 769) {
    return "mobile";
  } else if (scWidth < fixWidth) {
    return "tablet";
  } else {
    return "desktop";
  }
}

extension ForWeb on String {
  String forWeb({required bool web}) => web ? this.replaceFirst('assets/', '') : this;
}
