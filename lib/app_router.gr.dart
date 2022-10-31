// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import 'pages/add_child_page.dart' as _i6;
import 'pages/calendar_page.dart' as _i2;
import 'pages/login_page.dart' as _i7;
import 'pages/main_page.dart' as _i1;
import 'pages/new_task_page.dart' as _i4;
import 'pages/new_user_page.dart' as _i5;
import 'pages/special_task_page.dart' as _i8;
import 'pages/task_review.dart' as _i3;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CalendarPage(),
      );
    },
    TaskReviewRoute.name: (routeData) {
      final args = routeData.argsAs<TaskReviewRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.TaskReviewPage(
          task: args.task,
          key: args.key,
        ),
      );
    },
    NewTaskRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NewTaskPage(),
      );
    },
    NewUserRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NewUserPage(),
      );
    },
    AddChildRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AddChildPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    SpecialTaskRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SpecialTaskPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          CalendarRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          TaskReviewRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          NewTaskRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          NewUserRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          AddChildRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          SpecialTaskRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i9.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i3.TaskReviewPage]
class TaskReviewRoute extends _i9.PageRouteInfo<TaskReviewRouteArgs> {
  TaskReviewRoute({
    required _i2.Task task,
    _i10.Key? key,
  }) : super(
          TaskReviewRoute.name,
          path: '/',
          args: TaskReviewRouteArgs(
            task: task,
            key: key,
          ),
        );

  static const String name = 'TaskReviewRoute';
}

class TaskReviewRouteArgs {
  const TaskReviewRouteArgs({
    required this.task,
    this.key,
  });

  final _i2.Task task;

  final _i10.Key? key;

  @override
  String toString() {
    return 'TaskReviewRouteArgs{task: $task, key: $key}';
  }
}

/// generated route for
/// [_i4.NewTaskPage]
class NewTaskRoute extends _i9.PageRouteInfo<void> {
  const NewTaskRoute()
      : super(
          NewTaskRoute.name,
          path: '/',
        );

  static const String name = 'NewTaskRoute';
}

/// generated route for
/// [_i5.NewUserPage]
class NewUserRoute extends _i9.PageRouteInfo<void> {
  const NewUserRoute()
      : super(
          NewUserRoute.name,
          path: '/',
        );

  static const String name = 'NewUserRoute';
}

/// generated route for
/// [_i6.AddChildPage]
class AddChildRoute extends _i9.PageRouteInfo<void> {
  const AddChildRoute()
      : super(
          AddChildRoute.name,
          path: '/',
        );

  static const String name = 'AddChildRoute';
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.SpecialTaskPage]
class SpecialTaskRoute extends _i9.PageRouteInfo<void> {
  const SpecialTaskRoute()
      : super(
          SpecialTaskRoute.name,
          path: '/',
        );

  static const String name = 'SpecialTaskRoute';
}
