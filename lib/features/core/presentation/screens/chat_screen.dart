


import 'package:assessment/common/widgets/containers/percentage_container.dart';
import 'package:assessment/common/widgets/screens/bloc_screen.dart';
import 'package:assessment/common/widgets/text/body.dart';
import 'package:assessment/configs/ui_configs.dart';
import 'package:assessment/features/core/application/blocs/chat_bloc.dart';
import 'package:assessment/features/core/application/events/chat_events.dart';
import 'package:assessment/features/core/application/states/chat_state.dart';
import 'package:assessment/features/core/presentation/widgets/message_input.dart';
import 'package:assessment/features/core/presentation/widgets/messages_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends AsyncBlocScreen<ChatBloc, ChatState>{
  @override
  ChatBloc onCreateBloc(ChatState state) {
    return ChatBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, ChatState state) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 100.0),
            child: SingleChildScrollView(
              controller: state.scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MessagesWidget(state.messages!),
              )
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: ColorsConfigs.dark
            ),
            padding: const EdgeInsets.symmetric(
              vertical: SpacingConfigs.spacing3,
              horizontal: SpacingConfigs.spacing1
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.chevron_left,
                  color: ColorsConfigs.light,
                  size: 30,
                ),
                BodyText("강남스팟", fontSize: 15,),
                const Icon(
                  Icons.menu,
                  color: ColorsConfigs.light,
                  size: 30
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15
              ),
              decoration: const BoxDecoration(
                color: ColorsConfigs.dark
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  PercentageContainer(
                    width: 0.15,
                    child: const Icon(
                      Icons.add,
                      size: FontSizeConfigs.size3,
                      color: ColorsConfigs.light,
                    ),
                  ),
                  PercentageContainer(
                    width: 0.85,
                    child: MessageInput((message) {
                      context.read<ChatBloc>().add(SendMessageEvent(message));
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  ChatState onCreateState() {
    return ChatState();
  }

}