import 'package:assessment/common/widgets/buttons/circular_icon_button.dart';
import 'package:assessment/configs/ui_configs.dart';
import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  final Function onSubmit;

  MessageInput(this.onSubmit, {Key? key}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _isButtonEnabled.value = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(
        color: ColorsConfigs.light,
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 173, 173, 173),
        ),
        hintText: "메세지 보내기",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: ColorsConfigs.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: ColorsConfigs.grey,
          ),
        ),
        suffixIcon: Container(
          margin: EdgeInsets.all(8),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isButtonEnabled,
            builder: (context, isEnabled, child) {
              return CircularIconButton(
                size: FontSizeConfigs.size2,
                icon: Icons.arrow_upward,
                onPressed: () {
                  if(!isEnabled){
                    return;
                  }
                  widget.onSubmit(_controller.text);
                  _controller.text = "";
                }
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _isButtonEnabled.dispose();
    super.dispose();
  }
}
