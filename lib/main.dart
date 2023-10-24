import 'package:flutter/material.dart';
import 'package:prueba/pages/AdescriptivoG.dart';
import 'package:prueba/pages/AdescriptivoPA.dart';
import 'package:prueba/pages/AdiagnosticoG.dart';
import 'package:prueba/pages/AdiagnosticoP.dart';
import 'package:prueba/pages/ApredictivoES.dart';
import 'package:prueba/pages/ApredictivoT.dart';
import 'package:prueba/pages/AvaloresatipicosD.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Variables para almacenar las páginas correspondientes a cada opción del menú
  final Map<String, Widget> pages = {
    "General": AdescriptivoG(),
    "Por almacen": AdescriptivoPA(),
    "Ganancias": AdiagnosticoG(),
    "Perdidas": AdiagnosticoP(),
    "Entradas y salidas": ApredictivoES(),
    "Temporada": ApredictivoT(),
    "Detección": AvaloresatipicosD(),
  };

  String selectedOption = "General";

  // Función para realizar la navegación
  void navigateToPage(String option) {
    setState(() {
      selectedOption = option;
      Navigator.of(context).pop(); // Cierra el Drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 59, 111),
        title: Text(selectedOption), // Muestra la opción seleccionada en la barra de aplicación
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ExpansionTile(
                title: Text("Análisis descriptivo"),
                leading: Icon(Icons.bar_chart),
                childrenPadding: EdgeInsets.only(left: 60),
                children: [
                  for (String option in ["General", "Por almacen"])
                    ListTile(
                      title: Text("> $option"),
                      onTap: () => navigateToPage(option),
                    ),
                ],
              ),
              ExpansionTile(
                title: Text("Análisis de diagnóstico"),
                leading: Icon(Icons.bar_chart),
                childrenPadding: EdgeInsets.only(left: 60),
                children: [
                  for (String option in ["Ganancias", "Perdidas"])
                    ListTile(
                      title: Text("> $option"),
                      onTap: () => navigateToPage(option),
                    ),
                ],
              ),
              ExpansionTile(
                title: Text("Análisis predictivo"),
                leading: Icon(Icons.bar_chart),
                childrenPadding: EdgeInsets.only(left: 60),
                children: [
                  for (String option in ["Entradas y salidas", "Temporada"])
                    ListTile(
                      title: Text("> $option"),
                      onTap: () => navigateToPage(option),
                    ),
                ],
              ),
              ExpansionTile(
                title: Text("Análisis de valores atípicos"),
                leading: Icon(Icons.bar_chart),
                childrenPadding: EdgeInsets.only(left: 60),
                children: [
                  for (String option in ["Detección"])
                    ListTile(
                      title: Text("> $option"),
                      onTap: () => navigateToPage(option),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: pages[selectedOption], // Muestra la página correspondiente a la opción seleccionada
    );
  }
}



