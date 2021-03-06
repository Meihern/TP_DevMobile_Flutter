import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class QrScanPage extends StatefulWidget{
  @override
  _QrScanPageState createState() => _QrScanPageState();

}


class _QrScanPageState extends State<QrScanPage>{
  String result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(result!=null?result:'Scan QR', style: TextStyle(fontSize: 18)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.scanner),
          onPressed: scanQR,
          label: Text("QR Scan")
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future scanQR() async{
    try{
      String scanResult = await BarcodeScanner.scan();
      setState(() {
        result = scanResult;
      });
    }on PlatformException catch(e){
      if(e.code==BarcodeScanner.CameraAccessDenied){
        setState(() {
          result = "Camera permission was denied";
        });
      }
      else{
        setState(() {
          result = "Unknown Error";
        });
      }
    }
    on FormatException {
     result = "You pressed the back button before scanning";
    }
    catch(e){
      setState(() {
        result = "Somme error occured while scanning";
      });
    }

  }

}