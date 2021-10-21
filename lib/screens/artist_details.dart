import 'package:flutter/material.dart';
import 'package:lastfmdemo/providers/data_provider.dart';
import 'package:lastfmdemo/utils/state/widget_view.dart';
import 'package:lastfmdemo/widgets/display_view.dart';
import 'package:lastfmdemo/widgets/spin_kit.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  String artistName;
  DetailsScreen({this.artistName});

  @override
  _DetailsScreenController createState() => _DetailsScreenController();
}

class _DetailsScreenController extends State<DetailsScreen> {
  var _future;

  @override
  void initState() {
    _future = Provider.of<DataProvider>(context, listen: false)
        .getArtistDetails(widget.artistName);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _DetailsScreenView(this);
}

class _DetailsScreenView
    extends WidgetView<DetailsScreen, _DetailsScreenController> {
  _DetailsScreenView(_DetailsScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist details'),
      ),
      body: Center(
        child: FutureBuilder(
            future: state._future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DisplayView(
                  name: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['name'] ??
                      '',
                  bio: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['bio'] ??
                      '',
                  id: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['mbid'] ??
                      '',
                  listeners: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['stats']['listeners'] ??
                      '',
                  playCount: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['stats']['playcount'] ??
                      '',
                  streamable: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['streamable'] ??
                      '',
                  image: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['image'] ??
                      '',
                  similar: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['similar']['artist'] ??
                      '',
                  onTour: Provider.of<DataProvider>(context, listen: false)
                          .artistDetails['artist']['ontour'] ??
                      '',
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('An error has occured. Please try again later.'),
                );
              } else {
                return Center(child: SpinLoader());
              }
            }),
      ),
    );
  }
}
