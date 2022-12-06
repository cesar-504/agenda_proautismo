import 'package:agenda_proautismo/pages/add_child_page.dart';
import 'package:agenda_proautismo/pages/calendar_page.dart';
import 'package:agenda_proautismo/pages/login_page.dart';
import 'package:agenda_proautismo/pages/main_page.dart';
import 'package:agenda_proautismo/pages/new_task_page.dart';
import 'package:agenda_proautismo/pages/new_user_page.dart';
import 'package:agenda_proautismo/pages/special_task_page.dart';
import 'package:agenda_proautismo/pages/task_review.dart';
import 'package:auto_route/annotations.dart';

import 'pages/special_task_select_page.dart';


@MaterialAutoRouter(
replaceInRouteName: 'Page,Route',
routes: <AutoRoute>[
  AutoRoute(page:MainPage, initial: true,),
  AutoRoute(page:CalendarPage, ),
  AutoRoute(page:TaskReviewPage, ),
  AutoRoute(page:NewTaskPage, ),
  AutoRoute(page:NewUserPage, ),
  AutoRoute(page:AddChildPage, ),
  AutoRoute(page:LoginPage,),
  AutoRoute(page:SpecialTaskPage, ),
  AutoRoute(page:SpecialTaskSelectPage,),

]
)
class $AppRouter{

}