


import 'package:assessment/common/widgets/text/body.dart';
import 'package:assessment/configs/ui_configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

class MessagesWidget extends StatelessWidget{

  final List<BaseMessage> _messages;

  const MessagesWidget(this._messages, {super.key});

  int calculateMinutesSince(int timestamp) {
    DateTime givenTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();
    int differenceInMinutes = now.difference(givenTime).inMinutes;
    return differenceInMinutes;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(width: 10),
      ] + _messages.map(
              (message) {
                if(message.sender!.isCurrentUser){
                  return  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: SpacingConfigs.spacing1
                        ),
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color.fromARGB(255,255, 0, 107),Color.fromARGB(255, 255, 69, 147)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: BodyText(
                              message.message,
                              color: ColorsConfigs.light,
                              fontSize: 16,
                              textAlign: TextAlign.left,
                            )
                        ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SpacingConfigs.spacing1
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(message.sender!.profileUrl!),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 26, 26, 26),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BodyText(
                                  message.sender!.nickname ?? message.sender!.userId,
                                  color: const Color.fromARGB(255, 173, 173, 173),
                                  fontSize: 14,
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(width: 10,),
                                (message.sender!.connectionStatus == UserConnectionStatus.online)?
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                        color: Color.fromARGB(255, 70, 249, 245)
                                    )
                                ): 
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Color.fromARGB(255, 16, 16, 16),Color.fromARGB(255, 47, 47, 47)],
                                    )
                                  )
                                )
                                    
                              ],
                            ),
                            const SizedBox(height: 10,),
                            BodyText(
                              message.message,
                              color: ColorsConfigs.light,
                              fontSize: 16,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                      ),
                      const SizedBox(width: 10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: BodyText(
                          "${calculateMinutesSince(message.createdAt)} 분 전",
                          color: const Color.fromARGB(255, 156, 156, 163)
                        ),
                      )
                    ],
                  ),
                );
              }
      ).toList() + [
        const SizedBox(width: 10),
      ],
    );
  }

}