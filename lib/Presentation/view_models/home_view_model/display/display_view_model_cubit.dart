import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/Presentation/view_models/home_view_model/display/display_view_model_state.dart';
import 'package:my_gallery/domin/use_cases/display_use_case.dart';

@injectable
class DisplayViewModel extends Cubit<DisplayViewModelState> {
  DisplayViewModel(this.displayUseCase) : super(DisplayViewModelInitial());
  @factoryMethod
  DisplayUseCase displayUseCase;
   static DisplayViewModel get(BuildContext context) => BlocProvider.of(context);
  display({required String token}) async {
    emit(DisplayViewModeLoading());
    var response = await displayUseCase.call(token: token);
    response.fold((success) {
      emit(DisplayViewModeSuccess(success));
    }, (error) {
      emit(DisplayViewModeError(error));
    });
  }
}
