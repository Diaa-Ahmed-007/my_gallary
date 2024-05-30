import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/login_view_model_state.dart';
import 'package:my_gallery/domin/use_cases/login_use_case.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewModelState> {
  @factoryMethod
  LoginViewModel(this.loginUsecase) : super(LoginViewModelInitial());

  LoginUseCase loginUsecase;
  static LoginViewModel get(BuildContext context) => BlocProvider.of(context);
  login(String email, String password) async {
    emit(LoginViewModeLoading());
    var credential = await loginUsecase.call(email: email, password: password);
    credential.fold((success) {
      emit(LoginViewModeSuccess(success));
    }, (error) {
      emit(LoginViewModeError(error));
    });
  }
}
