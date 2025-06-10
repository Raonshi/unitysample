part of 'unity_ipc_manager.dart';

final class UnityIpcManagerImpl implements UnityIpcManager {
  final MethodChannel _ipcChannel = MethodChannel("@unity/ipc");
  @override
  void sendMessage(double rotation) {
    _ipcChannel.invokeMethod("setRotation", rotation);
  }
}
