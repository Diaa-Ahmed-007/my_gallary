import 'OriginalRequest.dart';
import 'Header.dart';

/// name : "Login"
/// originalRequest : {"method":"POST","header":[],"body":{"mode":"formdata","formdata":[{"key":"email","value":"swaniawski.lauren@example.net","type":"text"},{"key":"password","value":"password","type":"text"}]},"url":{"raw":"{{url}}auth/login","host":["{{url}}auth"],"path":["login"]}}
/// status : "OK"
/// code : 200
/// _postman_previewlanguage : "json"
/// header : [{"key":"Host","value":"localhost:8000"},{"key":"Date","value":"Sat, 29 Oct 2022 10:30:43 GMT"},{"key":"Date","value":"Sat, 29 Oct 2022 10:30:43 GMT"},{"key":"Connection","value":"close"},{"key":"X-Powered-By","value":"PHP/7.4.30"},{"key":"Cache-Control","value":"no-cache, private"},{"key":"Content-Type","value":"application/json"},{"key":"X-RateLimit-Limit","value":"60"},{"key":"X-RateLimit-Remaining","value":"59"},{"key":"Access-Control-Allow-Origin","value":"*"}]
/// cookie : []
/// body : "{\n    \"user\": {\n        \"id\": 1,\n        \"name\": \"Dr. Angeline Jerde\",\n        \"email\": \"swaniawski.lauren@example.net\",\n        \"email_verified_at\": \"2022-10-29T10:29:44.000000Z\",\n        \"created_at\": \"2022-10-29T10:29:44.000000Z\",\n        \"updated_at\": \"2022-10-29T10:29:44.000000Z\"\n    },\n    \"token\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE2MGVkODM5MjlmMDAzNzIwN2E5OGQ4OGQ3ODZmMWEzMGE4YWMxNjEyZGRjZTBkZmZkY2M4ZjZiNzI2NThiNTlkNzJhNTFlNGJlYjlhYWYiLCJpYXQiOjE2NjcwMzk0NDIuOTEyODUyLCJuYmYiOjE2NjcwMzk0NDIuOTEyODU3LCJleHAiOjE2OTg1NzU0NDIuODA0NjQ0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XIv-rCYm93m_kH-D2bmbJQ72qBsknAzM_9R1gw7wIt0GJQM_sktQa2n5REbHT590MgZmAZaCRenlyv1E1hswyatJa2_l4ev0r7ZJYmNdnhIvWrPuWxu_tG6htwU8HY24EfegFVzstcPdRbMAfAbkDiVvk1szCcyTvxQJ2BxXnZBJc_eM6wc_ugf9Lw9x23clYeNgcbEDh4skQ1gnl9vg0p5RCN5pjGvuLNyjOXJl2cB_2W4u20YWy1gaFTipghzTQ86yJwpLz_mC286v4p1jIYmJeUrrJId8pFjsDbxyNJnR7QPjXKS693bxyF6Xb4Zn23hcFVjTasac1R5DhxJSH7dbKqyuGsyiqSDu5mRZItHCDhgYWE7cmGEbXMvpSwHCVqOKUOGaz2LvlZdBMk7qkPzD8QpJ49tWLw4c3zLkxzqgZPyjHVkCCCi3FSFRwpuXEuI5aNRj-XF53VV2fi1n2AOECI_UmWUkAsSIuvA7uDmaI4U9hSvUvn7ynFAvCYuwtANMuZFqw-n4VaKOfIIhP0hSqdC3MeYcXXgAnOcsdUjOb5P28pCU6m76CP1hJlvqGZdDVJoCVOEwdQZ8AsZogjE3KGmscvGjTfcev32FhFGzyYiQjljCiwbm5OV5eH0LNWjHQD4exNP837vAtJpDWvVzoDmefnNQHlg74YMEBAY\"\n}"

class Response {
  Response({
      this.name, 
      this.originalRequest, 
      this.status, 
      this.code, 
      this.postmanPreviewlanguage, 
      this.header, 
      this.cookie, 
      this.body,});

  Response.fromJson(dynamic json) {
    name = json['name'];
    originalRequest = json['originalRequest'] != null ? OriginalRequest.fromJson(json['originalRequest']) : null;
    status = json['status'];
    code = json['code'];
    postmanPreviewlanguage = json['_postman_previewlanguage'];
    if (json['header'] != null) {
      header = [];
      json['header'].forEach((v) {
        header?.add(Header.fromJson(v));
      });
    }
    body = json['body'];
  }
  String? name;
  OriginalRequest? originalRequest;
  String? status;
  int? code;
  String? postmanPreviewlanguage;
  List<Header>? header;
  List<dynamic>? cookie;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (originalRequest != null) {
      map['originalRequest'] = originalRequest?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    map['_postman_previewlanguage'] = postmanPreviewlanguage;
    if (header != null) {
      map['header'] = header?.map((v) => v.toJson()).toList();
    }
    if (cookie != null) {
      map['cookie'] = cookie?.map((v) => v.toJson()).toList();
    }
    map['body'] = body;
    return map;
  }

}