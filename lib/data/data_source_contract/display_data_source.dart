import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';

abstract class DisplayDataSource {
  Future<Either<GalleryResponse, String>> getPhotos({required String token});
}
