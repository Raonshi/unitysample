enum UnityChannel {
  view(channelName: "@unity/view"),
  ipc(channelName: "@unity/ipc");

  final String channelName;

  const UnityChannel({required this.channelName});
}
