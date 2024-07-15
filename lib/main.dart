import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample/app/app.dart';

void main() async {
  await GetStorage.init();
  runApp(
    DevicePreview(
      enabled: kDebugMode ? true : false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const App(),
    ),
  );
}
