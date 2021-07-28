import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchMap extends StatefulWidget {
  @override
  _SearchMapState createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  TextEditingController searchController = TextEditingController();
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black, size: 20.0),
      title:field(),
      ),
     body: FutureBuilder(
        future: checkMap(),
        builder: (BuildContext context, AsyncSnapshot shot){
          return shot.data;
        },
      ),
    );
  }

  checkMap () async{
    bool _enabled = await Geolocator.isLocationServiceEnabled();
    try{
    if(_enabled==false){
      return Text('Please Enable Location Service');
    }else if(searchController.text.isNotEmpty){
      List<Location> _search = await locationFromAddress(searchController.text);
      Marker newmarkers =Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId:MarkerId(_search[0].timestamp.toString().substring(0,10)),
        position:LatLng(_search[0].latitude,_search[0].longitude),
      );
      setState(() {
        markers.add(newmarkers);
      });
      return buildMap(_search[0].latitude, _search[0].longitude);
    }
    else{
      Marker newmarkers =Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId:MarkerId('Cairo'),
        position:LatLng(30.0444, 31.2357),
      );
      setState(() {
        markers.add(newmarkers);
      });
      return buildMap(30.0444, 31.2357);
    }
    }catch(e){
      print(e);
    }
  }
  
  buildMap(double lat,double long){
   return GoogleMap(
     initialCameraPosition: CameraPosition(
        target: LatLng(lat, long),
        zoom: 12,
      ),
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: Set.from(markers),
    );
  }

   field(){
      return Container(
        height:30.0,
        margin:const EdgeInsets.all(8.0),
        child:TextField(
          decoration: InputDecoration(
            border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5),
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.black, width: 0.5),  
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5 ),
          ),
          prefixIcon: Icon(Icons.location_on, color: Colors.black),
          labelText: 'ex: Cairo'
          ),
          textInputAction: TextInputAction.search,
          controller: searchController,
          onSubmitted: (value){
           checkMap();
          },
        ),
      );

    }
  }
