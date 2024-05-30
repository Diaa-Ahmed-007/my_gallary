/// status : "success"
/// data : []
/// message : "Image uploaded successfully"
library;

class UploadPhotoResponse {
  UploadPhotoResponse({
    this.status,
    this.data,
    this.message,
  });

  UploadPhotoResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  List<dynamic>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }
}
