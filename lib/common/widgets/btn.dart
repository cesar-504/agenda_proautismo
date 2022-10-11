import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:agenda_proautismo/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

typedef Fun = void Function();

class Btn extends StatelessWidget {
  final Fun onPressed;
  final String text;
  final bool primary;
  final bool active;
  final bool enabled;
  final bool loading;
  final double fontSize;
  final Widget? leftIcon;
  const Btn({
    required this.text,
    required this.onPressed,
    this.primary = false,
    this.active = false,
    this.enabled = true,
    this.loading = false,
    this.fontSize = 14.0,
    this.leftIcon,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (primary)
          Positioned.fill(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: context.themeWatch.primaryColor,

                ),
              )),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(16.0)),
                        backgroundColor:
                            MaterialStateProperty.all<Color?>(active
                                ? context.themeWatch.primaryColor
                                : primary
                                    ? Colors.transparent
                                    : context.themeWatch.black),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            color: primary
                                ? Provider.of<ThemeProvider>(context).black
                                : Provider.of<ThemeProvider>(context).black,
                            width: 1.4)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .primaryColor)))),
                    onPressed: !enabled || loading ? null : onPressed,
                    child: loading
                        ? Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: (active
                                      ? Colors.white
                                      : primary
                                          ? Provider.of<ThemeProvider>(context)
                                              .white
                                          : Provider.of<ThemeProvider>(context)
                                              .black)),
                            ),
                        )
                        : Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(leftIcon!=null) leftIcon!,
                                if(leftIcon!=null) const Spacer(),
                                Text(
                                  text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: active
                                          ? Colors.white
                                          : primary
                                              ? Provider.of<ThemeProvider>(
                                                      context)
                                                  .black
                                              : Provider.of<ThemeProvider>(
                                                      context)
                                                  .white,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ],
    );
  }
}
