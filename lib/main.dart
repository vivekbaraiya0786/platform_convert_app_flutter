import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convert_app/controller/provider/chnageappprovider.dart';
import 'package:platform_convert_app/views/screens/homepage.dart';
import 'package:platform_convert_app/views/utils/apptheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/provider/changethememodeprovider.dart';
import 'modals/changeappmode.dart';
import 'modals/changethememode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isdarktheme = prefs.getBool('isdark') ?? false;
  bool apptheme = prefs.getBool('appthemechange') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // create: (context) =>  ChangeAppThemeProvider(),
          create: (context) => ChangeAppThemeProvider(
            changeAppModel: ChangeAppModel(AppthemeMode: apptheme),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeThemeProvider(
            changethemeModel: ChangeThemeModel(isDark: isdarktheme),
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SelectedDateProvider(),
        // )
      ],
      builder: (context, child) {
        return (Provider.of<ChangeAppThemeProvider>(context)
                    .changeAppModel
                    .AppthemeMode ==
                false)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lighttheme,
                darkTheme: AppTheme.Darktheme,
                themeMode: (Provider.of<ChangeThemeProvider>(context)
                            .changethemeModel
                            .isDark ==
                        false)
                    ? ThemeMode.light
                    : ThemeMode.dark,
                routes: {
                  '/': (context) => const homepage(),
                },
              )
            : CupertinoApp(
                theme: MaterialBasedCupertinoThemeData(
                    materialTheme: (Provider.of<ChangeThemeProvider>(context,
                                listen: false)
                            .changethemeModel
                            .isDark)
                        ? AppTheme.Darktheme
                        : AppTheme.lighttheme),
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (ctx) => const homepage(),
                },
              );
      },
    ),
  );
}
