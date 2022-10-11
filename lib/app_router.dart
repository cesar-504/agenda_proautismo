import 'package:agenda_proautismo/pages/calendar_page.dart';
import 'package:agenda_proautismo/pages/main_page.dart';
import 'package:auto_route/annotations.dart';


@MaterialAutoRouter(
replaceInRouteName: 'Page,Route',
routes: <AutoRoute>[
  AutoRoute(page:MainPage, initial: true,),
  AutoRoute(page:CalendarPage, initial: true,),

]
)
class $AppRouter{

}