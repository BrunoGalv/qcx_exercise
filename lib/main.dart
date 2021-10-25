import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qcx_exercise/src/app_module.dart';
import 'package:qcx_exercise/src/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget(),));
}