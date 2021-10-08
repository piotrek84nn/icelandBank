import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:iceland/helpers/extensions.dart';

class Api {
  _ApiClient? client;
  final String endpoint = 'api.weatherapi.com';
  final String apiVersion = 'v1';
  final String apiKey = 'acb175121efb4af2ab8104209210710';

  Api() {
    client = _ApiClient();
  }

  Future<Response> getForecastWeather(String parameter) async {
    Map<String, String> queryParameters = <String, String>{
      'key': apiKey,
      'q': parameter,
      'days': '2',
      'aqi': 'no',
      'alerts': 'no'
    };

    Uri url = Uri.http(endpoint, '/$apiVersion/forecast.json', queryParameters);
    var response = await client!.get(url);
    return response;
  }
}

class _ApiClient {
  final Client _client = Client();

  void close() {
    _client.close();
  }

  Future<Response> parseServerResponse(Response response,
      {BuildContext? context}) async {
    if (context != null) {
      if (response.statusCode >= 500) {
        String body = 'Internal Server Error';
        if (!response.body.isNullOrEmpty()) {
          body += ':\\n\\n${response.body}';
        }
        return Response(body, response.statusCode);
      }
    }
    return response;
  }

  Future<Map<String, String>> prepareHeaders() async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  Future<Response> get(Uri url, {BuildContext? context}) async {
    Response response = await _client.get(url, headers: await prepareHeaders());

    printRequest(url: url, type: "GET", response: response);
    return await parseServerResponse(response, context: context);
  }

  printRequest(
      {required Uri url,
      required String type,
      required Response response,
      Object? body}) {
    StringBuffer sb = StringBuffer();
    sb.write('************** HTTPS REQUEST **************\n');
    sb.write('Type: $type\n');
    sb.write('Request: $url\n');
    body.isNullOrEmpty() != true
        ? sb.write('BODY: ${body.toString()}\n')
        : sb.write('BODY: \n');
    sb.write('\n');

    sb.write('************** HTTPS RESPONSE **************\n');
    sb.write('Status code: ${response.statusCode}\n');
    sb.write('Body: ${response.body}\n');
    sb.write('\n\n');
    debugPrint(sb.toString(), wrapWidth: 1024);
  }
}
