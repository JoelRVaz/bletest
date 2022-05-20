import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/models/device.dart';
import 'package:watertcmapp2/services/bluetooth_client.dart';
import 'package:watertcmapp2/services/flutter_blue.dart';

final deviceProvider =
    StateNotifierProvider.autoDispose<DeviceNotifier, Device>((ref) {
  return DeviceNotifier();
});

class DeviceNotifier extends StateNotifier<Device> {
  DeviceNotifier() : super(Device());

  BluetoothClient bluetoothClient = BluetoothClient();
  FBlue fBlue = FBlue();
  BluetoothDevice? bluetoothDevice;
}
