import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdescriptivoPA extends StatefulWidget {
  @override
  State<AdescriptivoPA> createState() => _AdescriptivoPAState();
}

class _AdescriptivoPAState extends State<AdescriptivoPA> {
  DateTime selectedDate1 = DateTime.now(); // Primera fecha
  DateTime selectedDate2 = DateTime.now(); // Segunda fecha
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2000), // Minimo de fecha
      lastDate: DateTime(2101), // Maximo de fecha
    );
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2000), //Minimo de fecha
      lastDate: DateTime(2101), // Maximo de fecha
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(200, 15, 200, 100),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        
                        // Elementos para la primera fecha
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 0),
                          child: Text("Fecha"),
                          ),
                        TextButton(
                          onPressed: () => _selectDate1(context),
                          child: Icon(Icons.calendar_today),
                        ),
                        Text(dateFormat.format(selectedDate1)
                        ), // Muestra la fecha seleccionada

                        // Elementos para la segunda fecha
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 0),
                          child: Text("a"),
                        ),
                        TextButton(
                         onPressed: () => _selectDate2(context),
                         child: Icon(Icons.calendar_today),
                        ),
                        Text(dateFormat.format(selectedDate2)
                        ), // Muestra la segunda fecha seleccionada

                        // Se le agrega mas espacio entre elementos
                        SizedBox(width: 70),
                        // Boton "Mostrar"
                        ElevatedButton(
                         onPressed: () {
                        // Se le asignara una funcion en el futuro
                        },
                          child: Text("Mostrar"),
                        ),
                         // Aqui manda a llamar la clase TextContainer para que pueda mostrar el texto en pantalla
                        //               TextContainer(texto: textoFuturo),
                      ],
                   ),
                    ),

                   Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(70, 0, 70, 0),
                        child: Text("Almacen"), 
                        ),
                    ],
                   ),
                  ],
                )
              ),
            ),

            //comienza el segundo contenedor
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
              child: Container(
                width: double.infinity,
                height: 470,
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //aqui ira el codigo de la grafica
                  ],
                ),
              ),
            ),

            // Aqui el tercer contenedor
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(150, 50, 150, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 255, 255, 255),
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //Aqui ira todo el procedimiento de la IA
                    Text(
                        "   Aqui ira el texto que dara la IA lo cual no se puede modificar nada"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
