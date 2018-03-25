import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const limit = 100;

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class User {
  String title, firstname, lastname;
  String username;
  String email;
  String phone, cell;
  String street, city, state, postcode;
  String birthday;
  String smallpicture, bigpicture;
  bool isFavorite;

  User.fromJson(Map jsonMap)
      : title = capitalize(jsonMap['name']['title']),
        firstname = capitalize(jsonMap['name']['first']),
        lastname = capitalize(jsonMap['name']['last']),
        username = jsonMap['login']['username'],
        email = jsonMap['email'],
        phone = jsonMap['phone'],
        cell = jsonMap['cell'],
        street = capitalize(jsonMap['location']['street']),
        city = capitalize(jsonMap['location']['city']),
        state = capitalize(jsonMap['location']['state']),
        postcode = jsonMap['postcode'],
        birthday = jsonMap['dob'],
        smallpicture = jsonMap['picture']['thumbnail'],
        bigpicture = jsonMap['picture']['large'],
        isFavorite = false;

  String fullName() {
    return '$firstname $lastname';
  }

  String fullAddress() {
    return '$street $city $postcode $state';
  }
}

Future<Stream<User>> fetchUsers() async {
  var url = 'http://api.randomuser.me/?results=$limit';
  var client = new http.Client();
  var streamedRes = await client.send(new http.Request('get', Uri.parse(url)));

  return streamedRes.stream
      .transform(UTF8.decoder)
      .transform(JSON.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'])
      .map((jsonUser) => new User.fromJson(jsonUser));
}
     