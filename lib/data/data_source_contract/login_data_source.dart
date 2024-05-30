import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/models/login/LoginResponse.dart';

abstract class LoginDataSource {
  Future<Either<LoginResponse, String>> loginRequest(
      {required String email, required String password});
}
