// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medicinasyfarmacias/database/dbfarmacias.dart';
import 'package:medicinasyfarmacias/pantallas/horarios_sucursal.dart';
import 'package:medicinasyfarmacias/funciones/funciones.dart';

// ignore: must_be_immutable
class SucursalSeleccioanda extends StatefulWidget {
  SucursalSeleccioanda(
      {Key? key,
      required this.sucursal,
      required this.db,
      required this.idFarmacia})
      : super(key: key);
  Map sucursal;
  DatabaseFarmacias db;
  String idFarmacia;
  @override
  _SucursalSeleccioandaState createState() => _SucursalSeleccioandaState();
}

late Map sucursal;
late DatabaseFarmacias db;
String idFarm = "";
String nombreS = "";
String direccionS = "";
String telefonoS = "";
double latitudS = 0;
double longitudS = 0;

var preset = [
  {
    "id": nombreS,
    "lat": latitudS,
    "lng": longitudS,
    "titulo": "Sucursal",
    "desc": nombreS
  },
];

String _selectedOffice = '';

Iterable<Marker> _buildMarkers() {
  return preset.map((office) {
    return Marker(
        markerId: MarkerId(office['id'].toString()),
        position: LatLng(double.parse(office['lat'].toString()),
            double.parse(office['lng'].toString())),
        infoWindow: InfoWindow(
          title: office['titulo'].toString(),
          snippet: office['desc'].toString(),
        ),
        icon: office['id'] == _selectedOffice
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
            : BitmapDescriptor.defaultMarker,
        consumeTapEvents: false,
        onTap: () {});
  });
}

class _SucursalSeleccioandaState extends State<SucursalSeleccioanda> {
  @override
  void initState() {
    super.initState();
    db = widget.db;
    sucursal = widget.sucursal;
    nombreS = widget.sucursal['nombre'];
    direccionS = widget.sucursal['direccion'];
    telefonoS = widget.sucursal['telefono'];
    latitudS = double.parse(widget.sucursal['latitud']);
    longitudS = double.parse(widget.sucursal['longitud']);
    idFarm = widget.idFarmacia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Centra el título que está contenido dentro del appbar...
        centerTitle: true,
        //color de fondo del appbar
        backgroundColor: const Color(0xAAAA94FF),
        //Texto "Farmacias"
        title: const Text("Sucursal seleccionada"),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xAAD2FEFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            tituloPantalla(nombreS),
            const SizedBox(
              height: 10,
            ),
            Text("Dirección: " + direccionS,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            const SizedBox(
              height: 10,
            ),
            Text("Teléfono: " + telefonoS,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(latitudS, longitudS), zoom: 13),
                markers: _buildMarkers().toSet(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 100),
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 45.0,
                child: FlatButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HorarioSeleccionado(
                                  sucursal: sucursal,
                                  db: db,
                                  idFarmacia: idFarm)));
                    },
                    child: const Text(
                      "Horarios",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: "Tahoma",
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
