import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/core/api/api_manger.dart';
import 'package:my_gallery/core/api/end_points.dart';
import 'package:my_gallery/data/data_source_contract/upload_data_source.dart';
import 'package:my_gallery/data/models/home/upload/UploaPhotoResponse.dart';

@Injectable(as: UploadDataSource)
class UploadDataSourceImpl extends UploadDataSource {
  ApiManager apiManager;
  @factoryMethod
  UploadDataSourceImpl(this.apiManager);
  @override
  Future<Either<UploadPhotoResponse, String>> upload(
      {required String filePath, required String token}) async {
    try {
      ApiManager.dio.options.headers["Authorization"] = "Bearer $token";

      FormData formData = FormData.fromMap({
        "img": await MultipartFile.fromFile(filePath, filename: "upload.jpg"),
      });

      var response = await ApiManager.dio.post(
        EndPoints.uploadEndPoint,
        
        data: formData,
      );

      if (response.statusCode == 302) {
        var redirectUrl = response.headers.value('location');
        if (redirectUrl != null) {
          response = await ApiManager.dio.post(
            redirectUrl,
            data: formData,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
        }
      }
      UploadPhotoResponse uploadPhotoResponse =
          UploadPhotoResponse.fromJson(response.data);
      return Left(uploadPhotoResponse);
    } catch (error) {
      log('DioError: $error - $error');
      rethrow;
    }
  }
}
