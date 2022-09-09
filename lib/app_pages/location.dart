import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:mobile_type_portfolio/utils.dart';

class LocationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    double screenWidth = getScreenWidth(context);
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
      FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(35.6895014, 139.6917337),
          zoom: 4.0,
          maxZoom: 10.0,
          minZoom: 1.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            retinaMode: true,
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                point: latLng.LatLng(35.6895014, 139.6917337),
                builder: (ctx) => const Icon(
                  Icons.location_pin,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
      Positioned(
        // 緑のコンテナだけを親の左上に配置する
        bottom: screenHeight * 0.06,
        left: screenHeight * 0.05,
        child: Container(
          padding: EdgeInsets.all(screenWidth * 0.05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Text(
            'Tokyo Japan',
            style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    ]));
  }
}
