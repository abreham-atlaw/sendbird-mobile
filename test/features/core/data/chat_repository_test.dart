import 'package:assessment/features/core/data/repositories/chat_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assessment/configs/data_configs.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('ChatRepository', () {
    late ChatRepository chatRepository;

    setUp(() {
      chatRepository = ChatRepository();
    });

    test('initialize and send', () async {
      await chatRepository.initialize();
      await chatRepository.openChannel(sendBirdChannelID);
      await chatRepository.send('test message');
    });
  });
}
