
import 'package:my_gallery/data/models/home/display/GalleryResponse.dart';


sealed class DisplayViewModelState {}

final class DisplayViewModelInitial extends DisplayViewModelState {}
final class DisplayViewModeLoading extends DisplayViewModelState {}

final class DisplayViewModeSuccess extends DisplayViewModelState {
GalleryResponse galleryResponse;


  DisplayViewModeSuccess(this.galleryResponse);
}

final class DisplayViewModeError extends DisplayViewModelState {
  String error;
  DisplayViewModeError(this.error);
}