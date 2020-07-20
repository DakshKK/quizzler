// import 'dart:ui'; -> Check why it is imported
import 'package:flutter/material.dart';
import 'package:quizzler/route/routeGenerate.dart';

// TODO: Implement API to get questions from opentdb.com and make your app Quiz using that
void main() => runApp(
      MaterialApp(
        onGenerateRoute: RouteGenerate.generate,
        theme: ThemeData(
          fontFamily: 'NotoSerif',
          canvasColor: Colors.grey[900],
        ),
      ),
    );
