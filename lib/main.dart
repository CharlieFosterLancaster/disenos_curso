import 'package:disenos_curso/src/models/layout_model.dart';
import 'package:disenos_curso/src/pages/launcher_page.dart';
import 'package:disenos_curso/src/pages/launcher_tablet_page.dart';
import 'package:disenos_curso/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(ChangeNotifierProvider(create: (_) => ThemeCharger(2), child: MyApp()));

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => ThemeCharger(2)),
    ChangeNotifierProvider(create: (_) => LayoutModel()),
  ],
  child: MyApp())
  );


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseños App',
        theme: currentTheme,
        home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {

            // print(orientation);

            final screenSize = MediaQuery.of(context).size;

            if (screenSize.width > 500) {
              return LauncherTabletPage();
            } else {
              return LauncherPage();
            }

            // return Container(
            //   child: LauncherPage(),
            // );
          },
        ),
    );
  }
}
