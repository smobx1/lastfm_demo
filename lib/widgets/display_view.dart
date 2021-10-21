import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayView extends StatelessWidget {
  DisplayView({
    Key key,
    @required this.name,
    this.listeners,
    this.playCount,
    this.id,
    this.url,
    this.image,
    this.streamable,
    this.onTour,
    this.similar,
    this.bio,
    @required this.onTap,
  }) : super(key: key);

  String name;
  String id;
  var bio;

  String streamable;
  String onTour;

  String listeners;
  String playCount;
  String url;
  List image;
  List similar;
  Function onTap;

  _buildSimilarWidget(List similar) {
    if (similar.length == 0) {
      return Container();
    } else {
      for (int i = 0; i < similar.length; i++) {
        return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: similar.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(similar[index]['name']),
              ));
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Image.network(this.image[0]['#text']),
          Text(this.name),
          Divider(),
          Text('Bio\nPublished on: ' + this.bio['published']),
          Html(
            data: this.bio['summary'],
          ),
          Divider(),
          Text('Artist ID: ' + this.id),
          Text('Streamable: ' + this.streamable),
          Text('On tour: ' + this.onTour),
          Text('Listeners: ' + this.listeners),
          Text('Play count: ' + this.playCount),
          Divider(),
          const Text(
            'Similar artists:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildSimilarWidget(this.similar)
        ],
      ),
    );
  }
}
