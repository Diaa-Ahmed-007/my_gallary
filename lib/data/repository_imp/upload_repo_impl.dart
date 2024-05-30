import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/data_source_contract/upload_data_source.dart';
import 'package:my_gallery/data/models/home/upload/UploaPhotoResponse.dart';
import 'package:my_gallery/domin/repository_contract/upload_repo.dart';

@Injectable(as: UploadRepo)
class UploadRepositoryImpl extends UploadRepo {
  UploadDataSource uploadDataSource;
  @factoryMethod
  UploadRepositoryImpl(this.uploadDataSource);
  @override
  Future<Either<UploadPhotoResponse, String>> upload(
      {required String token, required String filePath}) async {
    var response =
        await uploadDataSource.upload(token: token, filePath: filePath);
    return response.fold((result) {
      return Left(result);
    }, (error) {
      return Right(error);
    });
  }
}
