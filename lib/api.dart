import 'dart:convert';

import 'package:event_task/Models/eventlistmodel.dart';
import 'package:http/http.dart';

class ClientApi {
  Client _client = Client();

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxZjNlMWJkYjE1ZmUwMzRhZTFmZmY0YSIsInBob25lIjoiKzkxOTgyNTA5ODI1MCIsImlhdCI6MTY0NDMwMDMzM30.mQ7IdL_ettGsCF2Foml72sJoyu85WngtUhKxTYtkD60";

  Future<EventListModel?> getData() async {
    var url = Uri.parse(
        "http://208.87.132.69:3012/api/v1/event/getAllEvent?limit=10&page=1");

    var responseData = await _client.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (responseData.statusCode == 200) {
      if (responseData.body.isNotEmpty) {
        final data = jsonDecode(responseData.body);

        //print(data);
        var myRespons = EventListModel.fromJson(data);

        String user = jsonEncode(myRespons);
        // Save Config here
        print("=====================Data Fromx API===================");
        print(user);
        print("========================================");

        return myRespons;
      } else {
        print("Error Here");
      }
    }
  }
}
