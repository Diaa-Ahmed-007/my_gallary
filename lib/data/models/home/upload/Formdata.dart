/// key : "img"
/// type : "file"
/// src : "/C:/Users/xps/Pictures/IMG_1460.JPG"

class Formdata {
  Formdata({
      this.key, 
      this.type, 
      this.src,});

  Formdata.fromJson(dynamic json) {
    key = json['key'];
    type = json['type'];
    src = json['src'];
  }
  String? key;
  String? type;
  String? src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['type'] = type;
    map['src'] = src;
    return map;
  }

}