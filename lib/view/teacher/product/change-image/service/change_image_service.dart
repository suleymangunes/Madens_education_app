import 'package:education_app_like_udemy/view/teacher/product/change-image/picker/pick_image.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ChangeImageService {
  final Box _token = Hive.box('token');
  Future<void> changeImage(int id) async {
    final String token = _token.get('myToken');

    var myfile = await PickImage().pickImage();
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST', Uri.parse('https://10.0.2.2:7278/api/Image/add-image'));
    request.fields.addAll({'courseId': id.toString()});
    request.files.add(await http.MultipartFile.fromPath('file', myfile));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

class AddVideoService {
  final Box _token = Hive.box('token');
  Future<void> addVideo(int id) async {
    final String token = _token.get('myToken');

    var myfile = await PickVideo().pickVideo();
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest('POST', Uri.parse('https://10.0.2.2:7278/api/Cloud/addVideo/$id'));
    request.files.add(await http.MultipartFile.fromPath('file', myfile));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
