import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/models/home/upload/UploaPhotoResponse.dart';
import 'package:my_gallery/domin/repository_contract/upload_repo.dart';

@injectable
class UploadUseCase {
  UploadRepo uploadRepo;
  @factoryMethod
  UploadUseCase(this.uploadRepo);
  Future<Either<UploadPhotoResponse, String>> call({
    required String filePath,
    required String token,
  }) =>
      uploadRepo.upload(filePath: filePath, token: token);
}
