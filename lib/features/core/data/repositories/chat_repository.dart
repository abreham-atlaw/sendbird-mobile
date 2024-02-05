


import 'package:assessment/configs/data_configs.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';


class MessageHandler with ChannelEventHandler{

  final Function _handler;
  final OpenChannel _channel;

  MessageHandler(this._handler, this._channel);

  @override
  void onMessageReceived(BaseChannel channel, BaseMessage message) {
    if(channel.channelUrl == _channel.channelUrl) {
      _handler(message);
    }
  }
}


class ChatRepository{

  SendbirdSdk? _sendbird;
  OpenChannel? _openChannel;

  initialize() async{
    _sendbird = SendbirdSdk(appId: sendBirdAppID);
    await _sendbird!.connect(sendBirdUserID, accessToken: sendBirdAccessToken);
  }

  openChannel(String channelUrl) async{
    _openChannel = await OpenChannel.getChannel(channelUrl);
  }

  Future<BaseMessage> send(String message) async{
    final params = UserMessageParams(message: message);
    return _openChannel!.sendUserMessage(params, onCompleted: (message, error) {
      print(error);
    });
  }

  Future<List<BaseMessage>> getChannelMessages() async{
    final query = PreviousMessageListQuery(
      channelType: _openChannel!.channelType,
      channelUrl: _openChannel!.channelUrl,
    )
    ..customTypesFilter = []
    ..senderIdsFilter = []
    ..messageTypeFilter = MessageTypeFilter.all;
    return await query.loadNext();
  }

  listen(Function handler){
    _sendbird!.addChannelEventHandler(handler.hashCode.toString(), MessageHandler(handler, _openChannel!));
  }

}