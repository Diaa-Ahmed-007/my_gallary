import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';
import 'package:my_gallery/domin/repository_contract/display_repo.dart';

@injectable
class DisplayUseCase {
  DisplayRepo displayRepo;
  @factoryMethod
  DisplayUseCase(this.displayRepo);
  Future<Either<GalleryResponse, String>> call({required String token}) =>
      displayRepo.getPhotos(token: token);
}
