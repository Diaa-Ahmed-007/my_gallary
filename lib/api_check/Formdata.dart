/// key : "email"
/// value : "swaniawski.lauren@example.net"
/// type : "text"

class Formdata {
  Formdata({
      this.key, 
      this.value, 
      this.type,});

  Formdata.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
    type = json['type'];
  }
  String? key;
  String? value;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    map['type'] = type;
    return map;
  }

}