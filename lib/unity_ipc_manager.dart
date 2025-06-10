import 'package:flutter/services.dart';
import 'package:unitysample/unity_channel.dart';

part 'unity_ipc_manager_impl.dart';

abstract interface class UnityIpcManager {
  void sendMessage(double rotation);
}
