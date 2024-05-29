/// key : "Host"
/// value : "localhost:8000"

class Header {
  Header({
      this.key, 
      this.value,});

  Header.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}