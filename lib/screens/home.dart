import 'package:flutter/material.dart';
import 'package:lastfmdemo/providers/data_provider.dart';
import 'package:lastfmdemo/screens/artist_details.dart';
import 'package:lastfmdemo/utils/state/widget_view.dart';
import 'package:lastfmdemo/widgets/display_card.dart';
import 'package:lastfmdemo/widgets/spin_kit.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:lastfmdemo/config/constants.dart' as Constants;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenController createState() => _HomeScreenController();
}

class _HomeScreenController extends State<HomeScreen> {
  var _future;

  void _handleArtistTap(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          artistName: id,
        ),
      ),
    );
  }

  @override
  void initState() {
    _future =
        Provider.of<DataProvider>(context, listen: false).searchArtist('a');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _HomeScreenView(this);
}

class _HomeScreenView extends WidgetView<HomeScreen, _HomeScreenController> {
  _HomeScreenView(_HomeScreenController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.appBackgroundColor,
      appBar: AppBar(
        title: Text('Last FM Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineSearchBar(
                borderColor: Constants.mainColor,
                onSearchButtonPressed: (keyword) {
                  Provider.of<DataProvider>(context, listen: false)
                      .searchArtist(keyword);
                },
                onKeywordChanged: (keyword) {
                  Provider.of<DataProvider>(context, listen: false)
                      .searchArtist(keyword);
                },
                onClearButtonPressed: (test) {
                  print('A FOST APASAT');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                hintText: 'Search artists...',
              ),
            ),
            FutureBuilder(
                future: state._future,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount:
                            Provider.of<DataProvider>(context).artists.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DisplayCard(
                              name: Provider.of<DataProvider>(context)
                                  .artists[index]['name'],
                              listeners: Provider.of<DataProvider>(context)
                                  .artists[index]['listeners'],
                              image: Provider.of<DataProvider>(context)
                                  .artists[index]['image'],
                              url: Provider.of<DataProvider>(context)
                                  .artists[index]['url'],
                              onTap: () {
                                state._handleArtistTap(
                                    Provider.of<DataProvider>(context,
                                            listen: false)
                                        .artists[index]['name']);
                              });
                        });
                  } else if (snapshot.hasError) {
                    return const Center(
                      child:
                          Text('An error has occured. Please try again later.'),
                    );
                  } else {
                    return Center(child: SpinLoader());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
