import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/data/data_source_contract/login_data_source.dart';
import 'package:my_gallery/data/models/login/LoginResponse.dart';
import 'package:my_gallery/domin/repository_contract/login_repo.dart';

@Injectable(as: LoginRepo)
class LoginRepositoryImpl extends LoginRepo {
  LoginDataSource loginDataSource;
  @factoryMethod
  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<Either<LoginResponse, String>> loginRequest(
      {required String email, required String password}) async {
    var response =
        await loginDataSource.loginRequest(email: email, password: password);
    return response.fold((result) {
      return Left(result);
    }, (error) {
      return Right(error);
    });
  }
}
