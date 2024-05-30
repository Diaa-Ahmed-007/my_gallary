import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/models/login/LoginResponse.dart';
import 'package:my_gallery/domin/repository_contract/login_repo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;
  @factoryMethod
  LoginUseCase(this.loginRepo);
  Future<Either<LoginResponse, String>> call(
          {required String email, required String password}) =>
      loginRepo.loginRequest(email: email, password: password);
}
