import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery/core/api/api_manger.dart';
import 'package:my_gallery/core/api/end_points.dart';
import 'package:my_gallery/data/data_source_contract/login_data_source.dart';
import 'package:my_gallery/data/models/login/LoginResponse.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource {
  ApiManager apiManager;
  @factoryMethod
  LoginDataSourceImpl(this.apiManager);
  @override
  Future<Either<LoginResponse, String>> loginRequest(
      {required String email, required String password}) async {
    var response = await apiManager.postRequest(
      endPoints: EndPoints.loginEndPoint,
      body: {
        "email": email,
        "password": password,
      },
      token: '',
    );
    try {
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        if (loginResponse.token == '') {
          return const Right("no data");
        }
        return Left(loginResponse);
      } else {
        return Right('Error: ${response.statusCode}');
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
}
