import 'package:flutter/services.dart';
import 'package:unitysample/model/unity_ipc_payload.dart';

part 'unity_ipc_manager_impl.dart';

abstract interface class UnityIpcManager {
  void sendMessage(UnityIpcSendPayload payload);
}
