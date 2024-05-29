/// raw : "{{url}}auth/login"
/// host : ["{{url}}auth"]
/// path : ["login"]

class Url {
  Url({
      this.raw, 
      this.host, 
      this.path,});

  Url.fromJson(dynamic json) {
    raw = json['raw'];
    host = json['host'] != null ? json['host'].cast<String>() : [];
    path = json['path'] != null ? json['path'].cast<String>() : [];
  }
  String? raw;
  List<String>? host;
  List<String>? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['raw'] = raw;
    map['host'] = host;
    map['path'] = path;
    return map;
  }

}