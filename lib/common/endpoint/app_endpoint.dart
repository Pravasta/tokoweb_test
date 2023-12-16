import 'uri_helper.dart';

class AppEndPoint {
  final String _baseUrl;

  AppEndPoint(this._baseUrl);

  Uri getListData({required String queue, required String key}) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "search/$queue",
      querryParameters: {
        'q': key,
      },
    );
  }
}


