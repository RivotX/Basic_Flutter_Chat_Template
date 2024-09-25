import 'package:yes_no_app/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  Future<Message> getAnswer() async {
    final dio = Dio();
    final response = await dio.get('https://yesno.wtf/api');

    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);
    return Message(
      text: yesNoModel.answer,
      fromWho: FromWho.her,
      imageUrl: yesNoModel.image,
    );
  }
}
