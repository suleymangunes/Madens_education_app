import 'package:education_app_like_udemy/view/teacher/product/change-image/picker/pick_image.dart';
import 'package:http/http.dart' as http;

class ChangeImageService {
  Future<void> changeImage(int id) async {
    var myfile = await PickImage().pickImage();
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidGVhY2hlckBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNjg0NjY2NzEzfQ.XMl1TjvCLAY3yfyntoUJO5CiLeowHZABNyTQgnZXXoiSGaU_cL64wH6d16xmoYYY58i7ANIeqVjdVBnMwtXVtA'
    };
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
