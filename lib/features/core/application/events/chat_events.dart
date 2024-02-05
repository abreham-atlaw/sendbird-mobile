


import 'package:assessment/common/async_bloc/async_events.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatBaseEvent extends AsyncEvent{

}


class SendMessageEvent extends ChatBaseEvent{
  final String message;
  SendMessageEvent(this.message);
}


class MessageReceivedEvent extends ChatBaseEvent{
  final BaseMessage message;
  MessageReceivedEvent(this.message);
}

