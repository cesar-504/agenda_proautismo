import 'dart:io';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:agenda_proautismo/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import 'package:agenda_proautismo/common/image_selector.dart';
import 'package:agenda_proautismo/common/result.dart';

import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:provider/provider.dart';

class DropData<T> {
  final Widget? icon;
  final String text;
  final T value;

  DropData({this.icon, required this.text, required this.value});
}

class Drop<T> extends StatefulWidget {
  final String? hintText;
  final Widget icon;
  final String text;
  final List<DropData<T>> values;
  final void Function(dynamic) onSelected;

  const Drop({
    required this.hintText,
    required this.icon,
    required this.text,
    required this.values,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  _DropState createState() => _DropState();
}

class _DropState extends State<Drop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.hintText ?? "",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(
          height: 4,
        ),
        IconBtn(icon: widget.icon, text: widget.text, onPressed: open),
      ],
    );
  }

  open() {
    Dialogs.bottomMaterialDialog(
        color: Colors.white,
        context: context,
        customView: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Selecciona una opción"),
              ),
              ...widget.values.map((v) => ListTile(
                    onTap: () => widget.onSelected(v.value),
                    leading: v.icon,
                    title: Text(v.text),
                    trailing: Icon(Icons.arrow_forward_outlined),
                  ))
            ],
          ),
        ),
        onClose: (_) {},
        actions: [
          IconsOutlineButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            onPressed: () async {
              Navigator.of(context).pop();
            },
            text: "Cancelar",
            //iconData: Icons.navigate_next,
            color: Colors.black,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
            padding: EdgeInsets.all(20),
          ),
        ]);
  }
}

class DropImage extends StatefulWidget {
  final void Function(dynamic) onSelected;
  final Widget icon;
  final String? hintText;
  final String text;
  final Function(Result<List<File>>) onImage;
  final maxImages;
  const DropImage({
    required this.onSelected,
    required this.icon,
    required this.hintText,
    required this.text,
    required this.onImage,
    this.maxImages = 1,
    Key? key,
  }) : super(key: key);

  @override
  State<DropImage> createState() => _DropImageState();
}

class _DropImageState extends State<DropImage> {
  List<File> files = [];
  @override
  Widget build(BuildContext context) {
    return Drop<void Function()>(
      hintText: widget.hintText,
      text: files.length >= 1
          ? "Se cargo una imagen"
          : files.length > 0
              ? "Se cargaron ${files.length} imagenes"
              : widget.text,
      icon: widget.icon,
      onSelected: (f) => f(),
      values: [
        DropData(
            icon: Icon(
              Icons.camera_alt,
              color: context.themeWatch.black,
            ),
            text: "Camara",
            value: () async {
              var image =
                  await ImageSelector.getImageList(context, camera: true);
              if (!image.ok!) {
                Alert.alert(context, image.msg!);
              }
              setState(() {
                files = image.data ?? [];
              });
              widget.onImage(image);
              // context.router.pop();
              Navigator.of(context).pop();
            }),
        DropData(
            icon: Icon(
              Icons.image_outlined,
              color: context.themeWatch.black,
            ),
            text: "Fotos",
            value: () async {
              var image =
                  await ImageSelector.getImageList(context, camera: false);
              if (!image.ok!) {
                Alert.alert(context, image.msg!);
              }
              setState(() {
                files = image.data ?? [];
              });
              widget.onImage(image);
              //context.router.pop();
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
dropVideo(BuildContext context, Function(Result<File>) onVideo) {
  Dialogs.bottomMaterialDialog(
      color: context.themeProvider.white,
      context: context,
      customView: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Selecciona una opción"),
            ),
            ...[
              DropData(
                  icon: Icon(
                    Icons.camera_alt,
                    color: context.themeProvider.black,
                  ),
                  text: "Cámara",
                  value: () async {
                    var image =
                    await ImageSelector.getVideo(context, camera: true);
                    if (!image.ok!) {
                      Alert.alert(context, image.msg!);
                    }
                    Navigator.of(context).pop();
                    onVideo(image);
                  }),
              DropData(
                  icon: Icon(
                    Icons.image_outlined,
                    color: context.themeProvider.black,
                  ),
                  text: "Vídeos",
                  value: () async {
                    var image =
                    await ImageSelector.getVideo(context, camera: false);
                    if (!image.ok!) {
                      Alert.alert(context, image.msg!);
                    }
                    Navigator.of(context).pop();
                    onVideo(image);
                  }),
            ].map((v) => ListTile(
              onTap: () => v.value(),
              leading: v.icon,
              title: Text(v.text),
              trailing: Icon(Icons.arrow_forward_outlined),
            ))
          ],
        ),
      ),
      onClose: (_) {},
      actions: [
        IconsOutlineButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () async {
            Navigator.of(context).pop();
          },
          text: "Cancelar",
          //iconData: Icons.navigate_next,
          color: WhiteTheme.primaryColor,
          textStyle: TextStyle(color: context.themeProvider.white),
          iconColor: Colors.white,
          padding: EdgeInsets.all(20),
        ),
      ]);
}

dropImage(BuildContext context, Function(Result<File>) onImage) {
  Dialogs.bottomMaterialDialog(
      color: context.themeProvider.white,
      context: context,
      customView: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Selecciona una opción"),
            ),
            ...[
              DropData(
                  icon: Icon(
                    Icons.camera_alt,
                    color: context.themeProvider.black,
                  ),
                  text: "Cámara",
                  value: () async {
                    var image =
                    await ImageSelector.getImage(context, camera: true);
                    if (!image.ok!) {
                      Alert.alert(context, image.msg!);
                    }
                    Navigator.of(context).pop();
                    onImage(image);
                  }),
              DropData(
                  icon: Icon(
                    Icons.image_outlined,
                    color: context.themeProvider.black,
                  ),
                  text: "Imagenes",
                  value: () async {
                    var image =
                    await ImageSelector.getImage(context, camera: false);
                    if (!image.ok!) {
                      Alert.alert(context, image.msg!);
                    }
                    Navigator.of(context).pop();
                    onImage(image);
                  }),
            ].map((v) => ListTile(
              onTap: () => v.value(),
              leading: v.icon,
              title: Text(v.text),
              trailing: Icon(Icons.arrow_forward_outlined),
            ))
          ],
        ),
      ),
      onClose: (_) {},
      actions: [
        IconsOutlineButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () async {
            Navigator.of(context).pop();
          },
          text: "Cancelar",
          //iconData: Icons.navigate_next,
          color: WhiteTheme.primaryColor,
          textStyle: TextStyle(color: context.themeProvider.white),
          iconColor: Colors.white,
          padding: EdgeInsets.all(20),
        ),
      ]);
}



class IconBtn extends StatelessWidget {
  final Fun onPressed;
  final Widget icon;
  final bool primary;
  final bool active;
  final double? size;
  final String? text;
  final TextStyle? textStyle;

  final EdgeInsets padding;
  IconBtn({
    required this.icon,
    required this.onPressed,
    this.primary = false,
    this.active = false,
    this.size,
    this.text,
    this.textStyle = null,
    this.padding = const EdgeInsets.all(20.0),
    Key? key,
  }) : super(key: key) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(padding),
            backgroundColor: MaterialStateProperty.all<Color>(active
                ? context.themeWatch.primaryColor
                : primary
                ? Provider.of<ThemeProvider>(context).black
                : Provider.of<ThemeProvider>(context).white),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
                color: Provider.of<ThemeProvider>(context).black, width: 1.2)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(
                        color: Provider.of<ThemeProvider>(context)
                            .primaryColor)))),
        onPressed: onPressed,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            if (text != null)
              SizedBox(
                width: 2,
              ),
            if (text != null)
              Text(
                text!,
                style: textStyle ??
                    TextStyle(color: Provider.of<ThemeProvider>(context).black),
              ),
            //Spacer(),
            icon,
          ],
        ),
      ),
    );
  }
}