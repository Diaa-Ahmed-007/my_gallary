import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/data_source_contract/display_data_source.dart';
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';
import 'package:my_gallery/domin/repository_contract/display_repo.dart';

@Injectable(as: DisplayRepo)
class DisplayRepositoryImpl extends DisplayRepo {
  DisplayDataSource displayDataSource;
  @factoryMethod
  DisplayRepositoryImpl(this.displayDataSource);
  @override
  Future<Either<GalleryResponse, String>> getPhotos(
      {required String token}) async {
    var response = await displayDataSource.getPhotos(token: token);
    return response.fold((result) {
      return Left(result);
    }, (error) {
      return Right(error);
    });
  }
}
