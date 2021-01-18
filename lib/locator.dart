import 'package:get_it/get_it.dart';
import 'package:weather_app/Services/auth_service.dart';
import 'package:weather_app/Services/database.dart';
import 'package:weather_app/Services/dialog_service.dart';
import 'package:weather_app/Services/network_service.dart';
import 'package:weather_app/Services/weather_service.dart';
import 'package:weather_app/ViewModels/login_view_model.dart';
import 'package:weather_app/ViewModels/register_viewmodel.dart';
import 'package:weather_app/ViewModels/splash_screen_viewmodel.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => WeatherService());

  // ! Factory
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => RegisterViewModel());
  locator.registerFactory(() => SplashScreenViewModel());
}
