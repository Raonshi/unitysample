import 'package:flutter/services.dart';

part 'unity_ipc_manager_impl.dart';

abstract interface class UnityIpcManager {
  void sendMessage(double rotation);
}
