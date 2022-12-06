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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import 'models/tasks.dart' as _i12;
import 'pages/add_child_page.dart' as _i6;
import 'pages/calendar_page.dart' as _i2;
import 'pages/login_page.dart' as _i7;
import 'pages/main_page.dart' as _i1;
import 'pages/new_task_page.dart' as _i4;
import 'pages/new_user_page.dart' as _i5;
import 'pages/special_task_page.dart' as _i8;
import 'pages/special_task_select_page.dart' as _i9;
import 'pages/task_review.dart' as _i3;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CalendarPage(),
      );
    },
    TaskReviewRoute.name: (routeData) {
      final args = routeData.argsAs<TaskReviewRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.TaskReviewPage(
          task: args.task,
          key: args.key,
        ),
      );
    },
    NewTaskRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NewTaskPage(),
      );
    },
    NewUserRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NewUserPage(),
      );
    },
    AddChildRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AddChildPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    SpecialTaskRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialTaskRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.SpecialTaskPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
    SpecialTaskSelectRoute.name: (routeData) {
      final args = routeData.argsAs<SpecialTaskSelectRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.SpecialTaskSelectPage(
          key: args.key,
          task: args.task,
          activityId: args.activityId,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        _i10.RouteConfig(
          CalendarRoute.name,
          path: '/calendar-page',
        ),
        _i10.RouteConfig(
          TaskReviewRoute.name,
          path: '/task-review-page',
        ),
        _i10.RouteConfig(
          NewTaskRoute.name,
          path: '/new-task-page',
        ),
        _i10.RouteConfig(
          NewUserRoute.name,
          path: '/new-user-page',
        ),
        _i10.RouteConfig(
          AddChildRoute.name,
          path: '/add-child-page',
        ),
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i10.RouteConfig(
          SpecialTaskRoute.name,
          path: '/special-task-page',
        ),
        _i10.RouteConfig(
          SpecialTaskSelectRoute.name,
          path: '/special-task-select-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i10.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/calendar-page',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i3.TaskReviewPage]
class TaskReviewRoute extends _i10.PageRouteInfo<TaskReviewRouteArgs> {
  TaskReviewRoute({
    required _i12.TaskMin task,
    _i11.Key? key,
  }) : super(
          TaskReviewRoute.name,
          path: '/task-review-page',
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

  final _i12.TaskMin task;

  final _i11.Key? key;

  @override
  String toString() {
    return 'TaskReviewRouteArgs{task: $task, key: $key}';
  }
}

/// generated route for
/// [_i4.NewTaskPage]
class NewTaskRoute extends _i10.PageRouteInfo<void> {
  const NewTaskRoute()
      : super(
          NewTaskRoute.name,
          path: '/new-task-page',
        );

  static const String name = 'NewTaskRoute';
}

/// generated route for
/// [_i5.NewUserPage]
class NewUserRoute extends _i10.PageRouteInfo<void> {
  const NewUserRoute()
      : super(
          NewUserRoute.name,
          path: '/new-user-page',
        );

  static const String name = 'NewUserRoute';
}

/// generated route for
/// [_i6.AddChildPage]
class AddChildRoute extends _i10.PageRouteInfo<void> {
  const AddChildRoute()
      : super(
          AddChildRoute.name,
          path: '/add-child-page',
        );

  static const String name = 'AddChildRoute';
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-page',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.SpecialTaskPage]
class SpecialTaskRoute extends _i10.PageRouteInfo<SpecialTaskRouteArgs> {
  SpecialTaskRoute({
    _i11.Key? key,
    required _i12.TaskMin task,
  }) : super(
          SpecialTaskRoute.name,
          path: '/special-task-page',
          args: SpecialTaskRouteArgs(
            key: key,
            task: task,
          ),
        );

  static const String name = 'SpecialTaskRoute';
}

class SpecialTaskRouteArgs {
  const SpecialTaskRouteArgs({
    this.key,
    required this.task,
  });

  final _i11.Key? key;

  final _i12.TaskMin task;

  @override
  String toString() {
    return 'SpecialTaskRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i9.SpecialTaskSelectPage]
class SpecialTaskSelectRoute
    extends _i10.PageRouteInfo<SpecialTaskSelectRouteArgs> {
  SpecialTaskSelectRoute({
    _i11.Key? key,
    required _i12.TaskMin task,
    required int activityId,
  }) : super(
          SpecialTaskSelectRoute.name,
          path: '/special-task-select-page',
          args: SpecialTaskSelectRouteArgs(
            key: key,
            task: task,
            activityId: activityId,
          ),
        );

  static const String name = 'SpecialTaskSelectRoute';
}

class SpecialTaskSelectRouteArgs {
  const SpecialTaskSelectRouteArgs({
    this.key,
    required this.task,
    required this.activityId,
  });

  final _i11.Key? key;

  final _i12.TaskMin task;

  final int activityId;

  @override
  String toString() {
    return 'SpecialTaskSelectRouteArgs{key: $key, task: $task, activityId: $activityId}';
  }
}
