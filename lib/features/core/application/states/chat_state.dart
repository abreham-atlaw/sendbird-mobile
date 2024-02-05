


import 'package:assessment/common/async_bloc/async_state.dart';
import 'package:assessment/common/async_bloc/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class ChatState extends AsyncState{

  List<BaseMessage>? messages;
  ScrollController scrollController = ScrollController();

  @override
  BaseState newInstance() {
    return ChatState();
  }

  @override
  void copyProperties(BaseState newState) {
    super.copyProperties(newState);
    (newState as ChatState).messages = messages;
    newState.scrollController = scrollController;
  }



}