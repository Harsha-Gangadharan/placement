import 'package:flutter/material.dart';
import 'package:placement/apimachinetest/provider/colourlist.dart';
import 'package:placement/apimachinetest/provider/colourprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorProvider()..fetchColors()),
      ],
      child: MaterialApp(
        title: 'Color List App',
          debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ColorListPage(),
      ),
    );
  }
}
