part of 'unity_ipc_manager.dart';

final class UnityIpcManagerImpl implements UnityIpcManager {
  final MethodChannel _ipcChannel = MethodChannel("@unity/ipc");
  @override
  void sendMessage(UnityIpcSendPayload payload) {
    _ipcChannel.invokeMethod(payload.type, payload.toJson());
  }
}
