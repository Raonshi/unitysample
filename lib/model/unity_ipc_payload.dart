sealed class UnityIpcSendPayload {
  final String type;
  const UnityIpcSendPayload({required this.type});

  Map<String, dynamic> toJson();
}

final class UnityIpcSetRotation extends UnityIpcSendPayload {
  final double rotation;

  const UnityIpcSetRotation({required this.rotation})
    : super(type: "setRotation");

  @override
  Map<String, dynamic> toJson() {
    return {"type": type, "rotation": rotation};
  }
}
