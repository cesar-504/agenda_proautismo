import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:agenda_proautismo/common/result.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:image_picker/image_picker.dart';

class CustomSortPathDelegate extends SortPathDelegate {
  const CustomSortPathDelegate();

  @override
  void sort(List<dynamic> list) {}
}

class CustomAssetsPickerTextDelegate implements AssetPickerTextDelegate {
  @override
  String cancel = "Cancelar";

  @override
  String confirm = "Confirmar";

  @override
  String edit = "Editar";

  @override
  String gifIndicator = "GIF";

  String heicNotSupported = "HEIC No soportado";

  @override
  String loadFailed = "Carga fallida";

  @override
  String original = "Original";

  @override
  String preview = "Previsualizar";

  @override
  String select = "Seleccionar";

  @override
  String unSupportedAssetType = "No soportado";

  @override
  String durationIndicatorBuilder(Duration duration) {
    const String separator = ':';
    final String minute = duration.inMinutes.toString().padLeft(2, '0');
    final String second =
        ((duration - Duration(minutes: duration.inMinutes)).inSeconds)
            .toString()
            .padLeft(2, '0');
    return '$minute$separator$second';
  }

  @override
  String get accessAllTip => "todo";

  @override
  String get accessLimitedAssets => "limitado";

  @override
  String get accessiblePathName => "ruta";

  @override
  String get changeAccessibleLimitedAssets => "";

  @override
  String get emptyList => "Lista vacía";

  @override
  String get goToSystemSettings => "ir a configuración";

  @override
  String get unableToAccessAll => "no es posible accesar";

  @override
  String get viewingLimitedAssetsTip => "vista limitada";

  @override
  String get languageCode => "es-MX";

  @override
  String get sActionPlayHint => "Reproducir";

  @override
  String get sActionPreviewHint => "Previsualizar";

  @override
  String get sActionSelectHint => "Seleccionar";

  @override
  String get sActionSwitchPathLabel => "Cambiar ruta";

  @override
  String get sActionUseCameraHint => "Usar camara";

  @override
  String get sNameDurationLabel => "Duración";

  @override
  String get sTypeAudioLabel => "Audio";

  @override
  String get sTypeImageLabel => "Imagen";

  @override
  String get sTypeOtherLabel => "Video";

  @override
  String get sTypeVideoLabel => "Otro archivo";

  @override
  String get sUnitAssetCountLabel => "Cantidad";

  @override
  String semanticTypeLabel(AssetType type) {
    switch (type) {
      case AssetType.audio:
        return sTypeAudioLabel;
      case AssetType.image:
        return sTypeImageLabel;
      case AssetType.video:
        return sTypeVideoLabel;
      case AssetType.other:
        return sTypeOtherLabel;
    }
  }

  @override
  AssetPickerTextDelegate get semanticsTextDelegate => this;
}

abstract class ImageSelector {
  static Future<Result<File>> getImage(BuildContext context,
      {required bool camera, int limit = 1}) async {
    try {
      if (camera) {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        if (pickedFile == null) {
          return R.err("No se selecciono niguna imagen");
        }
        return R.ok(File(pickedFile.path));
      }

      var resultList = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
            textDelegate: CustomAssetsPickerTextDelegate(), maxAssets: 1),
      );
      if (resultList == null || resultList.length == 0)
        return R.err("No se seleccionó ninguna imagen");

      var ima = await resultList.first.originFile;
      if (ima == null) return R.err("No se seleccionó ninguna imagen");
      return R.ok(ima);
    } on Exception catch (e) {
      return R.err("Ocurrió un error al obtener imagen:\n " + e.toString());
    }
  }

  static Future<Result<List<File>>> getImageList(BuildContext context,
      {required bool camera, int limit = 1}) async {
    try {
      if (camera) {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        if (pickedFile == null) {
          return R.err("No se seleccionó ninguna imagen");
        }
        return R.ok([File(pickedFile.path)]);
      }

      var resultList = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
            textDelegate: CustomAssetsPickerTextDelegate(), maxAssets: limit),
      );
      if (resultList == null || resultList.length == 0)
        return R.err("No se seleccionó ninguna imagen");
      List<File> list = [];
      for (var e in resultList) {
        list.add((await e.originFile)!);
      }

      return R.ok(list);
    } on Exception catch (e) {
      return R.err("Ocurrió un error al obtener imágenes:\n " + e.toString());
    }
  }

  static Future<Result<File>> getVideo(BuildContext context,
      {required bool camera, int limit = 1}) async {
    try {
      if (camera) {
        final picker = ImagePicker();
        final pickedFile = await picker.pickVideo(source: ImageSource.camera);
        if (pickedFile == null) {
          return R.err("No se seleccionó ningun video");
        }
        return R.ok(File(pickedFile.path));
      }
      final picker = ImagePicker();
      var pickedFile = await picker.pickVideo(source: ImageSource.gallery);
      if (pickedFile == null) {
        return R.err("No se seleccionó ningun video");
      }
      return R.ok(File(pickedFile.path));
    } on Exception catch (e) {
      return R.err("Ocurrió un error al obtener video:\n " + e.toString());
    }
  }
}
