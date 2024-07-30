
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_app/screen/home/provider/home_provider.dart';
import 'package:sky_app/utils/app_routes.dart';
import 'package:sky_app/utils/them.dart';

import 'component/provider/network_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NetworkProvider()..checkConnectivity()),
        ChangeNotifierProvider.value(
          value: HomeProvider()..getTheme(),
        ),
      ],
      child: Consumer<HomeProvider>(builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:value.theme =="Light"
            ?ThemeMode.light
            :value.theme=="Dark"
            ?ThemeMode.dark
            :ThemeMode.system,
        routes: app_routes,
      ),
      ),
    ),
  );
}