class CurriculumModel {
  String? publishId;
  String? videoName;
  String? videoUrl;
  String? title;
  String? description;
  int? courseID;

  CurriculumModel({this.publishId, this.videoName, this.videoUrl, this.title, this.description, this.courseID});

  CurriculumModel.fromJson(Map<String, dynamic> json) {
    publishId = json['publishId'];
    videoName = json['videoName'];
    videoUrl = json['videoUrl'];
    title = json['title'];
    description = json['description'];
    courseID = json['courseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['publishId'] = publishId;
    data['videoName'] = videoName;
    data['videoUrl'] = videoUrl;
    data['title'] = title;
    data['description'] = description;
    data['courseID'] = courseID;
    return data;
  }
}
