import 'package:disenos_curso/src/models/layout_model.dart';
import 'package:disenos_curso/src/pages/slideshow_page.dart';
import 'package:disenos_curso/src/routes/routes.dart';
import 'package:disenos_curso/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeCharger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.accentColor,
        title: Text("Diseños en flutter - Tablet"),
      ),
      // body: _ListaOpciones(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300.0,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1.0,
            height: double.infinity,
            color: (appTheme.darkTheme) ? Colors.grey : appTheme.currentTheme.accentColor,
          ),
          Expanded(
            child: layoutModel.currentPage
          )
        ],
      ),
      drawer: _MenuPrincipal(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeCharger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(color: appTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pageRoutes[i].page;
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeCharger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: CircleAvatar(
                      backgroundColor: accentColor,
                      child: Text('CF', style: TextStyle(fontSize: 50.0)))),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text(('Dark Mode')),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme, 
                activeColor: accentColor, 
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text(('Custom Theme')),
                trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: accentColor,
                    onChanged: (value) => appTheme.customTheme = value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
