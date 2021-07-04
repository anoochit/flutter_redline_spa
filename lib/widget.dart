import 'package:flutter/material.dart';
import 'package:flutter_redline_web2/home.dart';
import 'package:url_launcher/url_launcher.dart';

class TextSubHeadingContent extends StatelessWidget {
  const TextSubHeadingContent({
    Key? key,
    required this.screenType,
    required this.text,
  }) : super(key: key);

  final String screenType;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
      alignment: Alignment.center,
      width: ((screenType == "mobile")) ? (MediaQuery.of(context).size.width) : (MediaQuery.of(context).size.width * 0.9),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: (screenType == "mobile") ? 18.0 : 22.0),
      ),
    );
  }
}

class TextHeadingContent extends StatelessWidget {
  const TextHeadingContent({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.0),
      width: MediaQuery.of(context).size.width * 0.6,
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(text, style: kTitleHeader),
      ),
    );
  }
}

class BlockContent extends StatelessWidget {
  const BlockContent({
    Key? key,
    required this.screenType,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String screenType;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      width: (screenType == "mobile")
          ? (MediaQuery.of(context).size.width * 0.8)
          : (screenType == "tablet")
              ? (MediaQuery.of(context).size.width * 0.5)
              : (MediaQuery.of(context).size.width * 0.25),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Icon(icon, size: 80),
            ),
            Text(
              text,
              style: TextStyle(fontSize: (screenType == "mobile") ? 18.0 : 22.0),
            ),
          ],
        ),
      ),
    );
  }
}

class BlockProductContent extends StatelessWidget {
  const BlockProductContent({
    Key? key,
    required this.screenType,
    required this.text,
    required this.description,
    required this.asset,
  }) : super(key: key);

  final String screenType;
  final String text;
  final String description;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      width: (screenType == "mobile")
          ? (MediaQuery.of(context).size.width * 0.8)
          : (screenType == "tablet")
              ? (MediaQuery.of(context).size.width * 0.45)
              : (MediaQuery.of(context).size.width * 0.15),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              child: Image.asset(
                asset,
                width: 128,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: (screenType == "mobile") ? 18.0 : 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: (screenType == "mobile") ? 18.0 : 22.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonToURL extends StatelessWidget {
  const ButtonToURL({
    Key? key,
    required this.title,
    required this.url,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String url;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
        child: Container(
          width: 250,
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, size: 32),
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        onPressed: () async {
          await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
        },
      ),
    );
  }
}
