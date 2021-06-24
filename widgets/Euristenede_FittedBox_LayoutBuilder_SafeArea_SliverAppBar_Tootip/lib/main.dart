import 'package:flutter/material.dart';
import 'package:widgets/widgets/fitted_box.dart';
import 'package:widgets/widgets/safe_area.dart';
import 'package:widgets/widgets/silver_app_bar.dart';
import 'widgets/layout_builder.dart';
import 'widgets/tool_tip.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          //child:  SettingsBox(),
          //child:  ResponsiveLayout(),
          //child:  SettingsArea(),
          //child:  SliderAppBar(),
          child:  ToolTipAccessibility(),
        ),
      ),
    )
  );
}

