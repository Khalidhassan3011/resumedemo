import 'package:flutter/material.dart';
import 'app/common/util/initializer.dart';
import 'resume_demo.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const ResumeDemo());
  });
}