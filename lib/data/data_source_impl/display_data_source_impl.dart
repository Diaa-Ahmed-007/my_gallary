import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/core/api/api_manger.dart';
import 'package:my_gallery/core/api/end_points.dart';
import 'package:my_gallery/data/data_source_contract/display_data_source.dart';
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';

@Injectable(as: DisplayDataSource)
class DisplayDataSourceImpl extends DisplayDataSource {
  ApiManager apiManager;
  @factoryMethod
  DisplayDataSourceImpl(this.apiManager);
  @override
  Future<Either<GalleryResponse, String>> getPhotos(
      {required String token}) async {
    try {
      ApiManager.dio.options.headers["Authorization"] = "Bearer $token";
      var response = await apiManager.getRequest(
        endPoints: EndPoints.displayEndPoint,
        // queryParameters: {"token": token}
      );
      GalleryResponse galleryResponse = GalleryResponse.fromJson(response.data);
      return Left(galleryResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
