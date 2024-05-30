// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/display_data_source.dart' as _i4;
import '../../data/data_source_contract/login_data_source.dart' as _i6;
import '../../data/data_source_contract/upload_data_source.dart' as _i10;
import '../../data/data_source_impl/display_data_source_impl.dart' as _i5;
import '../../data/data_source_impl/login_data_source_impl.dart' as _i7;
import '../../data/data_source_impl/upload_data_source_impl.dart' as _i11;
import '../../data/repository_imp/display_repo_impl.dart' as _i15;
import '../../data/repository_imp/login_repo_impl.dart' as _i9;
import '../../data/repository_imp/upload_repo_impl.dart' as _i13;
import '../../domin/repository_contract/display_repo.dart' as _i14;
import '../../domin/repository_contract/login_repo.dart' as _i8;
import '../../domin/repository_contract/upload_repo.dart' as _i12;
import '../../domin/use_cases/display_use_case.dart' as _i17;
import '../../domin/use_cases/login_use_case.dart' as _i18;
import '../../domin/use_cases/upload_use_case.dart' as _i16;
import '../../Presentation/view_models/home_view_model/display/display_view_model_cubit.dart'
    as _i20;
import '../../Presentation/view_models/home_view_model/upload/upload_view_model_cubit.dart'
    as _i21;
import '../../Presentation/view_models/login_view_model/password/login_view_model_cubit.dart'
    as _i19;
import '../api/api_manger.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.DisplayDataSource>(
        () => _i5.DisplayDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.LoginDataSource>(
        () => _i7.LoginDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.LoginRepo>(
        () => _i9.LoginRepositoryImpl(gh<_i6.LoginDataSource>()));
    gh.factory<_i10.UploadDataSource>(
        () => _i11.UploadDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.UploadRepo>(
        () => _i13.UploadRepositoryImpl(gh<_i10.UploadDataSource>()));
    gh.factory<_i14.DisplayRepo>(
        () => _i15.DisplayRepositoryImpl(gh<_i4.DisplayDataSource>()));
    gh.factory<_i16.UploadUseCase>(
        () => _i16.UploadUseCase(gh<_i12.UploadRepo>()));
    gh.factory<_i17.DisplayUseCase>(
        () => _i17.DisplayUseCase(gh<_i14.DisplayRepo>()));
    gh.factory<_i18.LoginUseCase>(() => _i18.LoginUseCase(gh<_i8.LoginRepo>()));
    gh.factory<_i19.LoginViewModel>(
        () => _i19.LoginViewModel(gh<_i18.LoginUseCase>()));
    gh.factory<_i20.DisplayViewModel>(
        () => _i20.DisplayViewModel(gh<_i17.DisplayUseCase>()));
    gh.factory<_i21.UploadViewModel>(
        () => _i21.UploadViewModel(gh<_i16.UploadUseCase>()));
    return this;
  }
}
