
import 'package:agenda_proautismo/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {

}



extension AppProvidersB on BuildContext {

  MainProvider get mainProvider {
    return read<MainProvider>();
  }
  ThemeProvider get themeProvider {
    return read<ThemeProvider>();
  }
  MainProvider get mainWatch {
    return watch<MainProvider>();
  }
  ThemeProvider get themeWatch {
    return watch<ThemeProvider>();
  }
}