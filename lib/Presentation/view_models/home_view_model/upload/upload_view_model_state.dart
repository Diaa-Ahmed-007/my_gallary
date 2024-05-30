import 'package:my_gallery/data/models/home/upload/UploaPhotoResponse.dart';

sealed class UploadViewModelState {}

final class UploadViewModelInitial extends UploadViewModelState {}

final class UploadViewModeLoading extends UploadViewModelState {}

final class UploadViewModeSuccess extends UploadViewModelState {
  UploadPhotoResponse uploaPhotoResponse;
  UploadViewModeSuccess(this.uploaPhotoResponse);
}

final class UploadViewModeError extends UploadViewModelState {
  String error;
  UploadViewModeError(this.error);
}
