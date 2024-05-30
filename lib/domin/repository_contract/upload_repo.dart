import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/models/home/upload/UploaPhotoResponse.dart';

abstract class UploadRepo {
  Future<Either<UploadPhotoResponse, String>> upload({
    required String filePath,
    required String token,
  });
}
