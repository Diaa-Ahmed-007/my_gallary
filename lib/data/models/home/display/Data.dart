/// images : ["http://localhost:8000/media/1/IMG_1460.JPG","http://localhost:8000/media/2/IMG_1460.JPG","http://localhost:8000/media/3/IMG_1460.JPG"]

class Data {
  Data({
      this.images,});

  Data.fromJson(dynamic json) {
    images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  List<String>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['images'] = images;
    return map;
  }

}