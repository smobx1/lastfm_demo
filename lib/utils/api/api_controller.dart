import 'package:dio/dio.dart';

class ApiController {
  String _apiURL = 'http://ws.audioscrobbler.com/2.0/';

  String apiKey = '0e341ee7115655ac8595bf987150a31a';

  Future getArtists(String keyword) async {
    String _url = _apiURL +
        '?method=artist.search&artist=$keyword&api_key=$apiKey&format=json';

    Dio dio = new Dio();
    Response response = await dio.get(
      _url,
      options: Options(
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded;charset=utf-8',
        responseType: ResponseType.json,
      ),
    );

    if (response.statusCode == 200) {
      var artists = response.data['results']['artistmatches']['artist'];
      return artists;
    } else {
      return;
    }
  }

  Future getArtistsDetails(String name) async {
    String _url = _apiURL +
        '?method=artist.getinfo&artist=$name&api_key=$apiKey&format=json';

    Dio dio = new Dio();
    Response response = await dio.get(
      _url,
      options: Options(
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded;charset=utf-8',
        responseType: ResponseType.json,
      ),
    );
    print(response.data);

    if (response.statusCode == 200) {
      var artistDetails = response.data;
      return artistDetails;
    } else {
      return;
    }
  }
}
