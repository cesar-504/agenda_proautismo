import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/scroll_behavior.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:agenda_proautismo/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  final _mainProvider = MainProvider();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _mainProvider,
      builder: (c,w){
        return Consumer<MainProvider>(builder: (context,mainProvider,w){
          return ChangeNotifierProvider(
            create: (BuildContext context) => ThemeProvider(),
            builder: (c,w){
              //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

              return Consumer<MainProvider>(builder: (context,mainProvider,w){
                return MaterialApp.router(
                  scrollBehavior: MyCustomScrollBehavior(),
                  routerDelegate: _appRouter.delegate(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                );
              });
            },
          );
        });
      },
    );

  }
}
//Para pantalla principal revisar /pages/main_page.dart
