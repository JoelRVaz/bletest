import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/layout/app_page.dart';
import 'package:watertcmapp2/models/device.dart';
import 'package:watertcmapp2/providers/device/device_provider.dart';


class DevicePage extends ConsumerWidget {
  final Device device;
  const DevicePage({ Key? key,
    required this.device
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPage(
      title: device.macAdress,
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => ref.watch(deviceProvider.notifier)
              .bluetoothClient.disconnectDevice(), 
              child: const Text('Disconnect')
            ),
            ElevatedButton(
              onPressed: () => ref.watch(deviceProvider.notifier)
              .bluetoothClient.connectToDevice(device),
              child: const Text('Connect')
            ),
            ElevatedButton(
              onPressed: () => ref.watch(deviceProvider.notifier)
              .bluetoothClient.sendMessage(device.macAdress),
              child: const Text('send message')
            ),
            // ElevatedButton(
            //   onPressed: () => ref.watch(deviceProvider.notifier)
            //   .bluetoothClient.reader(device.macAdress),
            //   child: const Text('read message')
            // ),
            // ElevatedButton(
            //   onPressed: () => ref.watch(deviceProvider.notifier)
            //   .fBlue.connectToDevice(device.macAdress),
            //   child: const Text('flutter connect')
            // ),
            // ElevatedButton(
            //   onPressed: () => ref.watch(deviceProvider.notifier)
            //   .bluetoothClient.sendMessage(device.macAdress),
            //   child: const Text('send message')
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('readinger message')
            // ),
          ],
        )
      ),
    );
  }
}