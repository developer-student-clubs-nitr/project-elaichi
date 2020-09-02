import 'package:elaichi/app/locator.dart';
import 'package:elaichi/services/local_db.dart';
import 'package:elaichi/services/theme_manager.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class SnackbarServiceMock extends Mock implements SnackbarService {}

class ThemeManagerMock extends Mock implements ThemeManager {}

class LocalDbMock extends Mock implements LocalDb {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  final service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  final service = DialogServiceMock();
  locator.registerSingleton<DialogService>(service);
  return service;
}

SnackbarService getAndRegisterSnackbarServiceMock() {
  _removeRegistrationIfExists<SnackbarService>();
  final service = SnackbarServiceMock();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

ThemeManager getAndRegisterThemeManagerMock() {
  _removeRegistrationIfExists<ThemeManager>();
  final service = ThemeManagerMock();
  locator.registerSingleton<ThemeManager>(service);
  return service;
}

LocalDb getAndRegisterLocalDbMock() {
  _removeRegistrationIfExists<LocalDb>();
  final service = LocalDbMock();
  locator.registerSingleton<LocalDb>(service);
  return service;
}

void registerServices() {
  getAndRegisterDialogServiceMock();
  getAndRegisterNavigationServiceMock();
  getAndRegisterSnackbarServiceMock();
  getAndRegisterThemeManagerMock();
  getAndRegisterLocalDbMock();
}

void unregisterServices() {
  locator.unregister<DialogService>();
  locator.unregister<NavigationService>();
  locator.unregister<SnackbarService>();
  locator.unregister<ThemeManager>();
  locator.unregister<LocalDb>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) locator.unregister<T>();
}
