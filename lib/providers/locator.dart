import 'package:chatapp/providers/auth_provider.dart';
import 'package:chatapp/providers/conversations_provider.dart';
import 'package:get_it/get_it.dart';

//  simple Service Locator for Dart and Flutter projects  used to access objects e.g. from your UI.
GetIt locator = GetIt.instance;
void setuplocator() {
  // Lazy  singleton means oonly one instance will be created when we use the getter
  locator.registerLazySingleton(() => ConversationsProvider());
  // normal register means that it will be creating a new instance for each call of get
  locator.registerFactory(() => AuthProvider());
}
