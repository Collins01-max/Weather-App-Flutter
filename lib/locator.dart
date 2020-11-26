import 'package:get_it/get_it.dart';
import 'package:weather_app/Services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => DialogService());
}
