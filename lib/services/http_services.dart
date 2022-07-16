import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vendor/utility/utility.dart';

class HttpService {
  Future<dynamic> get(String url) async {
    Map<String, String> header = await getHeaders();

    Utility.customDebugPrint("requesting for get $url \nheader $header");

    var response = await http.get(Uri.parse(url), headers: header);

    Utility.customDebugPrint(
        "url: $url \nstatusCode: ${response.statusCode} \nheader $header \nresponse ${response.body}}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return Exception("Failed to load data");
    }
  }

  Future<dynamic> post(String url, dynamic body) async {
    Map<String, String> header = await getHeaders();
    Utility.customDebugPrint(
        "requesting for post $url \nheader $header \nbody: $body");

    var response = await http.post(Uri.parse(url), body: body, headers: header);

    Utility.customDebugPrint(
        "url: $url \nstatusCode: ${response.statusCode} \nheader $header \nbody $body \nresponse ${response.body}}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return Exception("Failed to load data");
    }
  }

  Future<dynamic> multipart({
    required String imagePath,
    required String url,
    required String id,
  }) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjJjZmYxMDY5MzUwNzBkZGQyOGE4ZDg1IiwidXNlcm5hbWUiOiJ0ZXN0VmVuZG9yIiwicm9sZSI6W3siX2lkIjoiNjIxYTA0MTdmZjk4ODdhNWUxYzE5YTkwIiwibmFtZSI6InZlbmRvciIsIl9fdiI6MH1dLCJuYW1lIjoidGVzdFZlbmRvciIsImVtYWlsIjoiYXBwcy5pdEBjYXJjbGVueC5jb20iLCJwaG9uZSI6IjIyMzIyMzIyMzIifSwiaWF0IjoxNjU3Nzk1MDE4LCJleHAiOjE5NzMzNzEwMTh9.0QWECYCb3K_Icq9Ae4-GinDo3OcGEKnbfPZMrfULAwE'
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'id': '62d2a93b537b202e5c1cb9a4'});
    request.files.add(http.MultipartFile.fromBytes(
      'upload',
      File(imagePath).readAsBytesSync(),
      filename: imagePath.split("/").last,
    ));
    request.headers.addAll(headers);

    Utility.customDebugPrint(
        "requesting for multipart $url \nheader $headers \nrequest ${request.fields} ${request.files[0].filename}");

    var res = await request.send();
    var response = await http.Response.fromStream(res);

    Utility.customDebugPrint(
        "$url \nheader $headers \nresponse ${response.body}");

    return response;
  }

  Future<Map<String, String>> getHeaders() async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json",
      'Content-type': 'application/json',
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjJjZmYxMDY5MzUwNzBkZGQyOGE4ZDg1IiwidXNlcm5hbWUiOiJ0ZXN0VmVuZG9yIiwicm9sZSI6W3siX2lkIjoiNjIxYTA0MTdmZjk4ODdhNWUxYzE5YTkwIiwibmFtZSI6InZlbmRvciIsIl9fdiI6MH1dLCJuYW1lIjoidGVzdFZlbmRvciIsImVtYWlsIjoiYXBwcy5pdEBjYXJjbGVueC5jb20iLCJwaG9uZSI6IjIyMzIyMzIyMzIifSwiaWF0IjoxNjU3Nzk1MDE4LCJleHAiOjE5NzMzNzEwMTh9.0QWECYCb3K_Icq9Ae4-GinDo3OcGEKnbfPZMrfULAwE'
    };

    return headers;
  }
}
