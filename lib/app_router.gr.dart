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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'pages/calendar_page.dart' as _i2;
import 'pages/main_page.dart' as _i1;
import 'pages/task_review.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    CalendarRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CalendarPage(),
      );
    },
    TaskReviewRoute.name: (routeData) {
      final args = routeData.argsAs<TaskReviewRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.TaskReviewPage(
          task: args.task,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CalendarRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          TaskReviewRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.CalendarPage]
class CalendarRoute extends _i4.PageRouteInfo<void> {
  const CalendarRoute()
      : super(
          CalendarRoute.name,
          path: '/',
        );

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [_i3.TaskReviewPage]
class TaskReviewRoute extends _i4.PageRouteInfo<TaskReviewRouteArgs> {
  TaskReviewRoute({
    required _i2.Task task,
    _i5.Key? key,
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'TaskReviewRouteArgs{task: $task, key: $key}';
  }
}
