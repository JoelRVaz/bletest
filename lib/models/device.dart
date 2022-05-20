import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class Device extends Equatable{
  String serial;
  String macAdress;
  String name;
  Device({
    this.serial = '',
    this.macAdress = '',
    this.name = ''
  });

  @override
  List<Object?> get props => [serial];
}
