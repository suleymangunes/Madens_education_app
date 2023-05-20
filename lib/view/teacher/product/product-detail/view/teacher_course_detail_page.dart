// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:education_app_like_udemy/core/components/text/text_title_large_normal.dart';
import 'package:education_app_like_udemy/core/components/text/text_title_medium.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/constants/api/api_constants.dart';
import 'package:education_app_like_udemy/product/widget/text/text_price.dart';
import 'package:education_app_like_udemy/view/_product/enum/get-course/get_course_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/model/teacher_product_model.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_cubit.dart';
import 'package:education_app_like_udemy/view/teacher/product/product-detail/view-model/teacher_course_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class TeacherCourseDetailPage extends StatelessWidget {
  const TeacherCourseDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TeahcerCourseDetailCubit()..getTeacherCourse(courseId: id),
        child: BlocBuilder<TeahcerCourseDetailCubit, ITeacherCourseDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case GetCourseEnum.initial:
                return const Text("data");
              case GetCourseEnum.loading:
                return const Text("data");
              case GetCourseEnum.completed:
                return TeacherCourseDetailView(model: (state as TeacherCourseDetailCompletedState).response);
              case GetCourseEnum.error:
                return const Text("data");
            }
          },
        ),
      ),
    );
  }
}

const String path = "https://10.0.2.2:7278/api/Image/add-image";
postData(Map<String, dynamic> body) async {
  var dio = Dio();
  try {
    FormData formData = FormData.fromMap(body);
    var response = await dio.post(path, data: formData);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class CourseImageService {
  final Box _token = Hive.box('token');

  changeCourseImage(body) async {
    final String token = _token.get('myToken');
    String link = "https://10.0.2.2:7278/api/Image/add-image";
    var c = await http.post(
      Uri.parse(link),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: body,
    );
    print(c.body);
  }
}

Future<void> gonder() async {
  var myfile = await pickImage();
  var headers = {
    'Authorization':
        'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoidGVhY2hlckBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWFjaGVyIiwiZXhwIjoxNjg0NjY2NzEzfQ.XMl1TjvCLAY3yfyntoUJO5CiLeowHZABNyTQgnZXXoiSGaU_cL64wH6d16xmoYYY58i7ANIeqVjdVBnMwtXVtA'
  };
  var request = http.MultipartRequest('POST', Uri.parse('https://10.0.2.2:7278/api/Image/add-image'));
  request.fields.addAll({'courseId': '1017'});
  request.files.add(await http.MultipartFile.fromPath('file', myfile));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

pickImage() async {
  final ImagePicker picker = ImagePicker();
  try {
    var image = await picker.pickImage(source: ImageSource.gallery);
    final File file = File(image!.path);

    return image.path;
    // Map body = {
    //   "key": file,
    //   "courseId": widget.model.courseID,
    // };
    // CourseImageService().changeCourseImage(body);

    print(file);
  } catch (e) {
    print(e);
  }
  return null;
}

class TeacherCourseDetailView extends StatefulWidget {
  const TeacherCourseDetailView({super.key, required this.model});
  final TeacherProductModel model;

  @override
  State<TeacherCourseDetailView> createState() => _TeacherCourseDetailViewState();
}

class _TeacherCourseDetailViewState extends State<TeacherCourseDetailView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: context.height * 0.5,
              width: context.width,
            ),
            Align(
              child: Image.network(
                "${ApiConstants.baseUrl}${widget.model.imageUrl}",
                height: context.height * 0.35,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/icon/icon.png",
                    height: context.height * 0.35,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: context.width * 0.15,
              child: MyCourseDetailCard(model: widget.model),
            ),
            Positioned(
              top: 20,
              right: 0,
              child: IconButton(
                onPressed: () {
                  // pickImage();
                  gonder();
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
        context.smallSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Müfredat",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () {
                CirruculumService().addCirruculumByCourseId(widget.model.courseID as int);
              },
              child: const Text("Ekle"),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.model.curriculums?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.all(context.lowValue),
                child: ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(widget.model.curriculums?[index].title.toString() ?? ""),
                  subtitle: Text(widget.model.curriculums?[index].description.toString() ?? ""),
                  trailing: IconButton(
                      onPressed: () {
                        NavigationRoute.goRouteNormalWithParam(RouteEnum.videoPage.rawValue,
                            widget.model.curriculums?[index].videoUrl.toString() as String);
                      },
                      icon: const Icon(Icons.videocam_outlined)),
                ),
              );
            },
          ),
        ),
        // Text(model.curriculums?.length.toString() ?? ""),
      ],
    );
  }
}

class CirruculumService {
  final Box _token = Hive.box('token');

  addCirruculumByCourseId(int courseID) async {
    Map mapim = {
      "publishId": "string",
      "videoName": "string",
      "videoUrl": "string",
      "title": "string",
      "description": "string",
      "courseID": courseID
    };
    var jsonhali = jsonEncode(mapim);
    var sonhal = jsonDecode(jsonhali);
    final String token = _token.get('myToken');
    String link = "https://10.0.2.2:7278/api/Curriculum/createCurri";
    var c = await http.post(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: jsonhali,
    );
    print(c.body);
  }
}

class MyCourseDetailCard extends StatelessWidget {
  const MyCourseDetailCard({
    super.key,
    required this.model,
  });
  final TeacherProductModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.2,
            width: context.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextTitleLarge(text: model.courseName.toString()),
                TextTitleMedium(text: model.courseDescription.toString()),
                TextPrice(price: model.coursePrice.toString()),

                // Text(model.courseName.toString()),
                // Text(model.courseDescription.toString()),
                // Text(model.coursePrice.toString()),
                // Text(model.createdDate.toString()),
                // Text(model.starAvg.toString()),
                ElevatedButton(
                  onPressed: () {
                    // TODO kursu kaldır
                    // NavigationRoute.goWithInt(RouteEnum.commentPage.rawValue, model.courseID as int);
                    DeleteCourse().deleteCourseById(model.courseID as int);
                  },
                  child: const Text("Kursu Kaldır"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteCourse {
  final Box _token = Hive.box('token');

  deleteCourseById(int id) async {
    final String token = _token.get('myToken');
    String link = "https://10.0.2.2:7278/api/Course?id=$id";
    var c = await http.delete(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    print(c.body);
  }
}
