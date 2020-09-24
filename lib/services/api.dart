import 'package:http/http.dart' as http;

class Api {
  //this is static cause we only need only 1 instance of this class for all the users
  static final _api = Api._internal();
// the constrctor returning the instance of the api
  factory Api() {
    return _api;
  }
  Api._internal();

// The toke, that we fetch from the database
  String token;
// The URL to the path tp the endpoint
  String baseUrl = 'http://192.168.1.8:81';
// The path
  String path = 'chatapp/public/api';

// The get request having the endPath and a list of parameters(the query)
// this function will fetch data from a given endpath passing a list of queries ( parameters)
  Future<http.Response> httpGet(String endPath, {Map<String, String> query}) {
    var uri = Uri.http(baseUrl, '$path/$endPath');
    if (query != null) {
      var uri = Uri.http(baseUrl, '$path/$endPath', query);
    }
// the list of header will be provided containing the token and the uri
    return http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }

// this function will post data to a given endpath passing a list of queries
  Future<http.Response> httpPost(String endPath, Object body) {
    Uri uri = Uri.http(baseUrl, '$path/$endPath');
// the list of header will be provided containing the token and the uri
    return http.post(uri, body: body, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }
}
