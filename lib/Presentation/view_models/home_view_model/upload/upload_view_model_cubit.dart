import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/upload/upload_view_model_state.dart';
import 'package:my_gallery/domin/use_cases/upload_use_case.dart';

@injectable
class UploadViewModel extends Cubit<UploadViewModelState> {
  UploadUseCase uploadUseCase;
  @factoryMethod
  UploadViewModel(this.uploadUseCase) : super(UploadViewModelInitial());
  static UploadViewModel get(BuildContext context) => BlocProvider.of(context);
  upload({
    required String filePath,
    required String token,
  }) async {
    emit(UploadViewModeLoading());
    var response = await uploadUseCase.call(filePath: filePath, token: token);
    response.fold((success) {
      emit(UploadViewModeSuccess(success));
    }, (error) {
      emit(UploadViewModeError(error));
    });
  }
}
