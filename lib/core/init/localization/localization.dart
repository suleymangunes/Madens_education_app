part of '/main.dart';

class LocaleVariables {
  const LocaleVariables._();

  static final List<Locale> _localesList = ProjectLocales.localesMap.keys.toList();
  static const String _localesPath = 'assets/translations';
  static const Locale _fallBackLocale = Locale('en', 'US');

  static List<DropdownMenuItem> localItems() {
    List<DropdownMenuItem> menuItems = [];
    for (var element in _localesList) {
      menuItems.add(DropdownMenuItem(
        value: element,
        child: Text(ProjectLocales.localesMap[element].toString()),
      ));
    }
    return menuItems;
  }

  static Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
