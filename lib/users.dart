import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const limit = 100;

class User {
  String title, firstname, lastname;
  String username;
  String email;
  String smallpicture, bigpicture;

  User.fromJson(Map jsonMap)
      : title = jsonMap['name']['title'],
        firstname = jsonMap['name']['first'],
        lastname = jsonMap['name']['last'],
        username = jsonMap['login']['username'],
        email = jsonMap['email'],
        smallpicture = jsonMap['picture']['thumbnail'],
        bigpicture = jsonMap['picture']['large'];
}

Future<Stream<User>> fetch() async {
  var url = 'http://api.randomuser.me/?results=$limit';
  var client = new http.Client();
  var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));

  return streamedRes.stream
      .transform(UTF8.decoder)
      .transform(JSON.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'])
      .map((jsonPlace) => new User.fromJson(jsonPlace));
}
     