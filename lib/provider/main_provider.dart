
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {

  // Usuario actual
  UserMin? _user;
  UserMin? get user => _user;

  List<Profile> _profiles = [];
  List<Profile> get profile => _profiles;

  void login(UserMin  u,List<Profile> p){
    _user=u;
    _profiles = p;
    notifyListeners();
  }
  void logOut(){
    _user= null;
    _profiles = [];
    notifyListeners();
  }
  void setProfiles(List<Profile> p){
    _profiles = p;
    notifyListeners();
  }
  bool get isAuthenticated => _user !=null;
  //



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