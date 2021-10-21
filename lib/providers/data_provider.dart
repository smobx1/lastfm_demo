import 'package:flutter/material.dart';
import 'package:lastfmdemo/utils/api/api_controller.dart';

class DataProvider with ChangeNotifier {
  var artists = [];
  var artistDetails;

  ApiController _controller = ApiController();

  searchArtist(String keyword) async {
    if (keyword != '') {
      artists = await _controller.getArtists(keyword);
    }

    notifyListeners();
    return artists;
  }

  getArtistDetails(String name) async {
    artistDetails = await _controller.getArtistsDetails(name);
    notifyListeners();
    return artistDetails;
  }

  getArtistsList() async {
    return artists;
  }
}
