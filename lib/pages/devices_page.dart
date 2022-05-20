import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/layout/app_page.dart';
import 'package:watertcmapp2/models/device.dart';
import 'package:watertcmapp2/navigation/main_router.gr.dart';
import 'package:watertcmapp2/providers/device/device_provider.dart';

final scanProvider = StreamProvider.autoDispose<List<Device>>((ref) {
  final device = ref.watch(deviceProvider.notifier);
  return device.bluetoothClient.scanDevices();
});

class DevicesPage extends ConsumerWidget {
  const DevicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    gotToDevicePage(Device device) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.pushRoute(DevicePageRoute(device: device));                              
      });
    }

    final devices = ref.watch(scanProvider);
    return AppPage(
        title: 'Devices',
        child: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            TextButton(
                onPressed: () {
                  ref.watch(deviceProvider.notifier).bluetoothClient.disconnectDevice();
                },
                child: const Text('disconnect')),
            TextButton(
                onPressed: () {
                  ref.refresh(scanProvider);
                },
                child: const Text('rescan')),
            devices.when(
                data: (devices) => Column(
                        children: devices.map((device) {
                      return ElevatedButton(
                          onPressed: () async {
                            await ref
                              .watch(deviceProvider.notifier)
                              .bluetoothClient
                              .connectToDevice(device);
                            
                            gotToDevicePage(device);
                          },
                          child: Column(children: [
                            Text(device.serial),
                            Text(device.name)
                          ]));
                    }).toList()),
                error: (error, stack) => Text(error.toString()),
                loading: () => const CircularProgressIndicator())
          ])),
        ));
  }
}
