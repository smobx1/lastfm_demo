import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayCard extends StatelessWidget {
  DisplayCard({
    Key key,
    @required this.name,
    this.listeners,
    this.url,
    this.image,
    @required this.onTap,
  }) : super(key: key);

  String name;
  String listeners;
  String url;
  List image;
  Function onTap;

  handleProfileView() async {
    // const url = "https://flutter.io";
    // if (await canLaunch(url))
    //   await launch(url);
    // else
    //   // can't launch url, there is some error
    //   throw "Could not launch $url";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onTap(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Text(this.image),

              // Text(this.url),
              // Image.network(this.image[0]['#text']), // small image
              Text(
                this.name,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
              Text('Listeners: ' + this.listeners),
              GestureDetector(
                onTap: () => handleProfileView(),
                child: const Text(
                  'View profile..',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
