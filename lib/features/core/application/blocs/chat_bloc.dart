


import 'package:assessment/common/async_bloc/async_bloc.dart';
import 'package:assessment/configs/data_configs.dart';
import 'package:assessment/features/core/application/events/chat_events.dart';
import 'package:assessment/features/core/application/states/chat_state.dart';
import 'package:assessment/features/core/data/repositories/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_sdk/core/message/base_message.dart';

class ChatBloc extends AsyncBloc<ChatState>{
  
  final _repository = ChatRepository();
  
  ChatBloc(super.initialState){
    on<SendMessageEvent>(_handleSendMessage);
    on<MessageReceivedEvent>(_handleMessageReceived);
  }
  
  @override
  Future<void> onInit() async{
    await super.onInit();
    await _repository.initialize();
    await _repository.openChannel(sendBirdChannelID);
    state.messages = await _repository.getChannelMessages();
    _repository.listen((BaseMessage message) {
      add(MessageReceivedEvent(message));
    });
  }


  _handleSendMessage(SendMessageEvent event, Emitter emitter) async{
    await asyncCall(event, emitter, (_, __) async{
      var message = await _repository.send(event.message);
      state.messages!.add(message);
    });
    state.scrollController.jumpTo(state.scrollController.position.maxScrollExtent);
  }

  _handleMessageReceived(MessageReceivedEvent event, Emitter emitter) async{
    state.messages!.add(event.message);
    syncState(emitter);
    state.scrollController.jumpTo(state.scrollController.position.maxScrollExtent);
  }

}