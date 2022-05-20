
import 'package:get_it/get_it.dart';
import 'package:watertcmapp2/providers/auth_provider/auth_provider.dart';
import 'package:watertcmapp2/services/uuid_service.dart';


GetIt locator = GetIt.instance;

void setuplocator() {
  locator.registerSingleton<AuthNotifier>(AuthNotifier());
  locator.registerSingleton<UuidService>(UuidService());

}