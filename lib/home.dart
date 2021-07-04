import 'dart:developer';
import 'package:flutter_redline_web2/widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ScrollController scrollController = ScrollController();
  PageController pageController = PageController();
  int index = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        index = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenType = checkScreenSize(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData.fallback(),
        title: Row(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "redlinesoft",
                  style: kLogoText,
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
                                  style: (index == i) ? kMainMenuCurrent : kMainMenu,
                                ),
                              ),
                              onTap: () {
                                log('tab menu index = ' + i.toString());
                                scrollTo(i);
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
              child: Text("ขอใบเสนอราคา"),
              onPressed: () async {
                var url = "https://forms.gle/FzyueDBfHDvhh9EF6";
                await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
              },
            )
          ],
        ),
        actions: (screenType == "mobile")
            ? [
                PopupMenuButton(
                    enabled: true,
                    onSelected: (value) {
                      scrollTo(int.parse(value.toString()));
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
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              pageSnapping: true,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade100,
                  height: MediaQuery.of(context).size.height - 60,
                  child: listPage[index],
                );
              },
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.black,
      //   child: (index < 3) ? Icon(Icons.arrow_downward) : Icon(Icons.arrow_upward),
      //   onPressed: () {
      //     log(index.toString());
      //     if (index < 3) {
      //       scrollTo(index + 1);
      //     } else {
      //       scrollUp();
      //     }
      //   },
      // ),
    );
  }

  void scrollUp() {
    pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void scrollDown() {
    pageController.animateToPage(listMenu.length, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void scrollTo(int index) {
    pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

// home widget
class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black12, BlendMode.colorBurn),
        ),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: FittedBox(
            child: Text("เราเปลี่ยนไอเดียให้กลายเป็นผลิตภัณฑ์", style: kTitleHeader),
          ),
        ),
      ),
    );
  }
}

// service widget
class ServiceWidget extends StatefulWidget {
  ServiceWidget({Key? key}) : super(key: key);

  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    var screenType = checkScreenSize(context);
    log(screenType);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/service_image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.colorBurn),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextHeadingContent(text: "พัฒนาผลิตภัณฑ์ที่ใช้งานได้"),
            TextSubHeadingContent(
              screenType: screenType,
              text:
                  "เรารู้ว่าคุณมีไอเดียมากมาย มากเสียจนเริ่มต้นไม่ถูก ให้เราช่วยเหลือคุณพัฒนาออกมาให้เป็นผลิตภัณฑ์ที่ไม่ได้เป็นแค่ไอเดียในกระดาษอีกต่อไป ด้วยประสบการณ์ มากกว่า 20 ปี ด้านการออกแบบพัฒนาผลิตภัณฑ์ทั้งฮาร์ดแวร์และซอฟต์แวร์ เราสามารถช่วยคุณสร้างผลิตภัณฑ์ที่ใช้งานได้จริงพร้อมใช้งาน",
            ),
            ButtonToURL(title: "ขอใบเสนอราคา", icon: Icons.qr_code_scanner, url: "https://forms.gle/FzyueDBfHDvhh9EF6"),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                BlockContent(screenType: screenType, text: "Mobile App", icon: Icons.mobile_friendly),
                BlockContent(screenType: screenType, text: "Web App", icon: Icons.dashboard),
                BlockContent(screenType: screenType, text: "Cloud", icon: Icons.cloud),
                BlockContent(screenType: screenType, text: "Blockchain", icon: Icons.monetization_on),
                BlockContent(screenType: screenType, text: "Maintenance", icon: Icons.construction),
                BlockContent(screenType: screenType, text: "Tech Consult", icon: Icons.comment_rounded),
              ],
            ),
            SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}

// product portfolio widget
class ProductPortfolioWidget extends StatefulWidget {
  ProductPortfolioWidget({Key? key}) : super(key: key);

  @override
  _ProductPortfolioWidgetState createState() => _ProductPortfolioWidgetState();
}

class _ProductPortfolioWidgetState extends State<ProductPortfolioWidget> {
  @override
  Widget build(BuildContext context) {
    var screenType = checkScreenSize(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/portfolio_image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextHeadingContent(text: "ตัวอย่างผลงาน"),
            TextSubHeadingContent(
              screenType: screenType,
              text:
                  "มีลูกค้ามากมายที่เข้ามาพบเรา มาพร้อมกับไอเดียที่พรั่งพรูและอยากที่จะพัฒนาผลิตภัณฑ์ด้านซอฟต์แวร์แต่ไม่รู้ว่าจะเริ่มอย่างไร เราช่วยค้นหาความต้องการและสิ่งที่เป็นคุณค่าที่แท้จริงให้กับลูกค้า ตลอดจน สร้างผลิตภัณพ์ที่มีคุณค่าให้กับลูกค้าของคุณอย่างแท้จริง",
            ),
            ButtonToURL(title: "ดาวน์โหลดเอกสาร", icon: Icons.download, url: "https://docs.google.com/presentation/d/10hQv2H9I52tMH-QM4Gb_FoXouVZgO8ZrPMvNN6vhtTU/edit?usp=sharing"),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                BlockProductContent(screenType: screenType, text: "Zeal", description: "IoT Platform", asset: "assets/images/logo_zeal.png"),
                BlockProductContent(screenType: screenType, text: "0ood", description: "IoT Dashboard", asset: "assets/images/logo_0ood.png"),
                BlockProductContent(screenType: screenType, text: "NutPed", description: "Private Chat", asset: "assets/images/logo_nutped.png"),
                BlockProductContent(screenType: screenType, text: "NutPed Dash", description: "Web Dashboard", asset: "assets/images/logo_nutped_dash.png"),
                BlockProductContent(screenType: screenType, text: "Dementia", description: "Health Care", asset: "assets/images/logo_dementia.png"),
                BlockProductContent(screenType: screenType, text: "Blood Presure Log", description: "Health Care", asset: "assets/images/logo_blood_pressure_log.png"),
                BlockProductContent(screenType: screenType, text: "PinkyBink", description: "Dating App", asset: "assets/images/logo_pinkybink.png"),
                BlockProductContent(screenType: screenType, text: "PinkyBink Console", description: "Mobile Dashboard", asset: "assets/images/logo_pinkybink_console.png"),
                BlockProductContent(screenType: screenType, text: "DoggyGirl", description: "Dating App", asset: "assets/images/logo_doggygirl.png"),
              ],
            ),
            SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}

// open source widget
class OpenSourceProjectWidget extends StatefulWidget {
  OpenSourceProjectWidget({Key? key}) : super(key: key);

  @override
  _OpenSourceProjectWidgetState createState() => _OpenSourceProjectWidgetState();
}

class _OpenSourceProjectWidgetState extends State<OpenSourceProjectWidget> {
  @override
  Widget build(BuildContext context) {
    var screenType = checkScreenSize(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/code_image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.color),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextHeadingContent(text: "โครงการโอเพ่นซอร์ส"),
            TextSubHeadingContent(
              screenType: screenType,
              text: "นอกจากพัฒนาผลิตภัณฑ์ให้กับลูกค้าแล้ว เรายังมีโครงการโอเพ่นซอร์สที่เปิดให้นักพัฒนาที่สนใจสามารถนำไปใช้งานและพัฒนาต่อยอดได้ ภายใต้สัญญาอนุญาตแบบโอเพ่นซอร์ส",
            ),
            ButtonToURL(title: "Git Repository", icon: Icons.code, url: "https://github.com/RedLine-Software")
          ],
        ),
      ),
    );
  }
}

// contact widget
class ContactWidget extends StatefulWidget {
  ContactWidget({Key? key}) : super(key: key);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/contact_image.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.color),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextHeadingContent(text: "ติดต่อเรา"),
            SizedBox(height: 64),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(64),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("RedLine Software", style: TextStyle(fontSize: 22.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("107 หมู่ 10 ต.สุรนารี อ.เมือง จ.นครราชสีมา 30000", style: TextStyle(fontSize: 18.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("โทรศัพท์ 089 843 3717", style: TextStyle(fontSize: 18.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Email info@redlinesoft.net", style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// data
List<String> listMenu = [
  "หน้าหลัก",
  "บริการ",
  "ตัวอย่างผลงาน",
  "โอเพ่นซอร์ส",
  "ติดต่อ",
];

// style
TextStyle kMainMenu = TextStyle(fontSize: 16, color: Colors.black);
TextStyle kMainMenuCurrent = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle kTitleHeader = TextStyle(color: Colors.white, fontSize: 48);
TextStyle kTitleHeaderMobile = TextStyle(color: Colors.white, fontSize: 32);
TextStyle kLogoText = GoogleFonts.pacifico(fontSize: 28, color: Colors.black);

// list page container
List<Widget> listPage = [
  HomeWidget(),
  ServiceWidget(),
  ProductPortfolioWidget(),
  OpenSourceProjectWidget(),
  ContactWidget(),
];

// utils
String checkScreenSize(BuildContext context) {
  var scWidth = MediaQuery.of(context).size.width;

  log(scWidth.toString());

  if (scWidth < 412) {
    return "mobile";
  } else if (scWidth < 960) {
    return "tablet";
  } else {
    return "desktop";
  }
}
