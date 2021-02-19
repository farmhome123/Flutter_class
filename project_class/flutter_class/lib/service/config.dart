import 'dart:io';
import 'package:http/http.dart' as http;

class connect {
  String url = "http://3f1181ad6b52.ngrok.io/";
  var header = {HttpHeaders.contentTypeHeader: "application/json"};

  Future<http.Response> post(router, data) {
    return http.post(url + router, body: data, headers: header);
  }

  Future<http.Response> get(router) {
    return http.get(url + router, headers: header);
  }

  Future<http.Response> delete(router) {
    return http.delete(url + router, headers: header);
  }

  Future<http.Response> put(router, data) {
    return http.put(url + router, headers: header, body: data);
  }
}
