import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';

abstract class DisplayRepo {
    Future<Either<GalleryResponse, String>> getPhotos({required String token});

}