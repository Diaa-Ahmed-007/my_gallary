import 'Body.dart';
import 'Url.dart';

/// method : "POST"
/// header : []
/// body : {"mode":"formdata","formdata":[{"key":"email","value":"swaniawski.lauren@example.net","type":"text"},{"key":"password","value":"password","type":"text"}]}
/// url : {"raw":"{{url}}auth/login","host":["{{url}}auth"],"path":["login"]}

class OriginalRequest {
  OriginalRequest({
      this.method, 
      this.header, 
      this.body, 
      this.url,});

  OriginalRequest.fromJson(dynamic json) {
    method = json['method'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
    url = json['url'] != null ? Url.fromJson(json['url']) : null;
  }
  String? method;
  List<dynamic>? header;
  Body? body;
  Url? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['method'] = method;
    if (header != null) {
      map['header'] = header?.map((v) => v.toJson()).toList();
    }
    if (body != null) {
      map['body'] = body?.toJson();
    }
    if (url != null) {
      map['url'] = url?.toJson();
    }
    return map;
  }

}