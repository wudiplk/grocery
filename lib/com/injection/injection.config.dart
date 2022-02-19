// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../main/good/good_model.dart' as _i3;
import '../../main/good/good_view_model.dart' as _i4;
import '../../main/home/home_model.dart' as _i5;
import '../../main/home/home_view_model.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GoodModel>(() => _i3.GoodModel());
  gh.factory<_i4.GoodViewModel>(() => _i4.GoodViewModel());
  gh.factory<_i5.HomeModel>(() => _i5.HomeModel());
  gh.factory<_i6.HomeViewModel>(() => _i6.HomeViewModel());
  return get;
}
