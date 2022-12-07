import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:gaspayapp/component/error_dialog.dart';
import 'package:gaspayapp/controllers/data_controllers.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/pages/pin_verify.dart';
import 'package:gaspayapp/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//void main() => runApp(const MaterialApp(home: MyHome()));

class Scanpage extends StatelessWidget {
  const Scanpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: const QRViewPage(),

      // Center(

      //   child: AppLargeButton(
      //     onTap: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) =>
      //       ));
      //     },
      //     text: 'Tap to scan',
      //     textColor: Colors.white,
      //   ),
      // ),
    );
  }
}

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  final DataController _controller = Get.find();
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: 20,
            child: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return IconButton(
                    icon: const Icon(Icons.cameraswitch_rounded),
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: _buildQrView(context),
              ),
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Builder(builder: (context) {
                        if (result != null) {
                          if (result!.code != null) {
                            _controller.list.add(jsonDecode(result!.code!));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Scan successful'),
                                    content: Text('Data added to list'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                        },
                                        child: const Text('Okay'),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const ErrorDialog("Scan failed");
                                });
                          }

                          return const SizedBox.shrink();
                        } else {
                          return const SizedBox.shrink();
                          //Text('Scan a code');
                        }
                      }),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       margin: const EdgeInsets.all(8),
                      //       child: AppButtons(
                      //         text: 'continue to payment',
                      //         icon: Icons.arrow_forward,
                      //         onTap: () {
                      //           Get.to(Verify());
                      //         },

                      //         // onPressed: () async {
                      //         //   await controller?.toggleFlash();
                      //         //   setState(() {});
                      //         // },
                      //         // child: FutureBuilder(
                      //         //   future: controller?.getFlashStatus(),
                      //         //   builder: (context, snapshot) {
                      //         //     return Text('Flash: ${snapshot.data}');
                      //         //   },
                      //         // )),
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: const EdgeInsets.all(8),
                      //       child: ElevatedButton(
                      //           onPressed: () async {
                      //             await controller?.flipCamera();
                      //             setState(() {});
                      //           },
                      //           child: FutureBuilder(
                      //             future: controller?.getCameraInfo(),
                      //             builder: (context, snapshot) {
                      //               if (snapshot.data != null) {
                      //                 return Text(
                      //                     'Camera facing ${describeEnum(snapshot.data!)}');
                      //               } else {
                      //                 return const Text('loading');
                      //               }
                      //             },
                      //           )),
                      //     )
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: <Widget>[
                      //     Container(
                      //       margin: const EdgeInsets.all(8),
                      //       child: AppButtons(
                      //         onTap: () async {
                      //           await controller?.pauseCamera();
                      //         }, text: 'Pause', icon: Icons.pause,
                      //         ),
                      //       ),
                      //     Container(
                      //       margin: const EdgeInsets.all(8),
                      //       child: AppButtons(
                      //         onTap: () async {
                      //           await controller?.resumeCamera();
                      //         },
                      //         icon: Icons.restart_alt, text: 'resume',
                      //         ),
                      //       ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 300 ||
            MediaQuery.of(context).size.height < 300)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.yellow,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// {
//     "id": "39248",
//     "brand": "Shell Fuels",
//     "date": "12-01-08",
//     "status": false,
//     "due": "30.00",
//     "more": "Pay Before",
//     "img": "images/brand3.png"
//   }
