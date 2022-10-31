import 'package:agenda_proautismo/pages/add_child_page.dart';
import 'package:agenda_proautismo/pages/calendar_page.dart';
import 'package:agenda_proautismo/pages/login_page.dart';
import 'package:agenda_proautismo/pages/main_page.dart';
import 'package:agenda_proautismo/pages/new_task_page.dart';
import 'package:agenda_proautismo/pages/new_user_page.dart';
import 'package:agenda_proautismo/pages/special_task_page.dart';
import 'package:agenda_proautismo/pages/task_review.dart';
import 'package:auto_route/annotations.dart';


@MaterialAutoRouter(
replaceInRouteName: 'Page,Route',
routes: <AutoRoute>[
  AutoRoute(page:MainPage, initial: true,),
  AutoRoute(page:CalendarPage, initial: true,),
  AutoRoute(page:TaskReviewPage, initial: true,),
  AutoRoute(page:NewTaskPage, initial: true,),
  AutoRoute(page:NewUserPage, initial: true,),
  AutoRoute(page:AddChildPage, initial: true,),
  AutoRoute(page:LoginPage, initial: true,),
  AutoRoute(page:SpecialTaskPage, initial: true,),

]
)
class $AppRouter{

}