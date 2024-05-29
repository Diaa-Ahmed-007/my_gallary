import 'Formdata.dart';

/// mode : "formdata"
/// formdata : [{"key":"email","value":"swaniawski.lauren@example.net","type":"text"},{"key":"password","value":"password","type":"text"}]

class Body {
  Body({
      this.mode, 
      this.formdata,});

  Body.fromJson(dynamic json) {
    mode = json['mode'];
    if (json['formdata'] != null) {
      formdata = [];
      json['formdata'].forEach((v) {
        formdata?.add(Formdata.fromJson(v));
      });
    }
  }
  String? mode;
  List<Formdata>? formdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mode'] = mode;
    if (formdata != null) {
      map['formdata'] = formdata?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}