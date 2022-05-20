import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:watertcmapp2/locator.dart';
import 'package:watertcmapp2/models/device.dart';
import 'package:watertcmapp2/services/bluetooth_service.dart';
import 'package:watertcmapp2/services/uuid_service.dart';

class BluetoothClient {
  FlutterReactiveBle flutterReactiveBle = FlutterReactiveBle();

  StreamSubscription<ConnectionStateUpdate>? connection;
  StreamController<ConnectionStateUpdate> connectionController =
      StreamController.broadcast();

  Future<ConnectionStateUpdate> connectToDevice(Device device) async {

    print(device.macAdress);
    disconnectDevice();
    Stream<ConnectionStateUpdate> connectionStream;
    connection = flutterReactiveBle
        .connectToDevice(
      id: device.macAdress,
      // connectionTimeout: const Duration(seconds: 10),
    )
        .listen((connectionState) {
      print(connectionState);
      print(connectionState.connectionState == ConnectionStatus.connected);
      print("llglglg");
      connectionController.sink.add(connectionState);
      // Handle connection state updates
    }, onError: (Object error) {
      // Handle a possible error
    });

    return await connectionController.stream.firstWhere((element) {
      if(element.connectionState == DeviceConnectionState.connected) {
        reader(device.macAdress);
      }
      return element.connectionState == DeviceConnectionState.connected;
    });
  }

  Future<void> disconnectDevice() async {
    print(connection?.isPaused);
    await connection?.cancel();
  }

  StreamController<List<Device>> scanController = StreamController.broadcast();

  Stream<List<Device>> scanDevices() {
    Set<Device> devices = {};
    print("object");
    flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      //code for handling results
      devices.add(
          Device(macAdress: device.id, serial: device.id, name: device.name));
      scanController.sink.add(devices.toList());
    }, onError: (Object error) {
      throw error;
      //code for handling error
    });
    return scanController.stream;
  }

  StreamSubscription? recieverStream;
  

  void reader(String deviceId) {
    print("------}}}}-----");
    final characteristic = QualifiedCharacteristic(
        serviceId: Uuid.parse('6E400001-B5A3-F393-E0A9-E50E24DCCA9E'),
        characteristicId: Uuid.parse('6E400003-B5A3-F393-E0A9-E50E24DCCA9E'),
        deviceId: deviceId);
    recieverStream?.cancel();
    recieverStream = flutterReactiveBle
        .subscribeToCharacteristic(characteristic)
        .listen((data) {
      print(String.fromCharCodes(data));
      // code to handle incoming data
    }, onError: (dynamic error) {
      // code to handle errors
    });
  }

  void sendMessage(String deviceId) async {
    String requestUuid = locator<UuidService>().hello();
    print(requestUuid);
    List<int> message = encode("""{
    "type": "command",
    "command": "c",
    "uuid": "$requestUuid"
    }""");
    try {
      final characteristic = QualifiedCharacteristic(
          serviceId: Uuid.parse('6E400001-B5A3-F393-E0A9-E50E24DCCA9E'),
          characteristicId: Uuid.parse('6E400002-B5A3-F393-E0A9-E50E24DCCA9E'),
          deviceId: deviceId);
      final response = await flutterReactiveBle
          .writeCharacteristicWithoutResponse(characteristic, value: message);
    } catch (e) {}
  }
}
