class BasketModel {
  int? basketId;
  bool? status;
  int? studentId;
  int? conversationId;
  List<Courses>? courses;

  BasketModel({this.basketId, this.status, this.studentId, this.conversationId, this.courses});

  BasketModel.fromJson(Map<String, dynamic> json) {
    basketId = json['basketId'];
    status = json['status'];
    studentId = json['studentId'];
    conversationId = json['conversationId'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['basketId'] = basketId;
    data['status'] = status;
    data['studentId'] = studentId;
    data['conversationId'] = conversationId;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? courseID;
  String? courseName;
  String? courseDescription;
  String? imageUrl;
  num? coursePrice;
  num? starAvg;
  String? createdDate;
  String? teacherName;
  int? categoryId;
  int? id;
  List<Curriculums>? curriculums;
  String? queueDate;

  Courses(
      {this.courseID,
      this.courseName,
      this.courseDescription,
      this.imageUrl,
      this.coursePrice,
      this.starAvg,
      this.createdDate,
      this.teacherName,
      this.categoryId,
      this.id,
      this.curriculums,
      this.queueDate});

  Courses.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    imageUrl = json['imageUrl'];
    coursePrice = json['coursePrice'];
    starAvg = json['starAvg'];
    createdDate = json['createdDate'];
    teacherName = json['teacherName'];
    categoryId = json['categoryId'];
    id = json['id'];
    if (json['curriculums'] != null) {
      curriculums = <Curriculums>[];
      json['curriculums'].forEach((v) {
        curriculums!.add(Curriculums.fromJson(v));
      });
    }
    queueDate = json['queueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseID'] = courseID;
    data['courseName'] = courseName;
    data['courseDescription'] = courseDescription;
    data['imageUrl'] = imageUrl;
    data['coursePrice'] = coursePrice;
    data['starAvg'] = starAvg;
    data['createdDate'] = createdDate;
    data['teacherName'] = teacherName;
    data['categoryId'] = categoryId;
    data['id'] = id;
    if (curriculums != null) {
      data['curriculums'] = curriculums!.map((v) => v.toJson()).toList();
    }
    data['queueDate'] = queueDate;
    return data;
  }
}

class Curriculums {
  int? curriculumId;
  String? publishId;
  String? videoName;
  String? videoUrl;
  String? title;
  String? description;
  int? courseID;

  Curriculums(
      {this.curriculumId, this.publishId, this.videoName, this.videoUrl, this.title, this.description, this.courseID});

  Curriculums.fromJson(Map<String, dynamic> json) {
    curriculumId = json['curriculumId'];
    publishId = json['publishId'];
    videoName = json['videoName'];
    videoUrl = json['videoUrl'];
    title = json['title'];
    description = json['description'];
    courseID = json['courseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['curriculumId'] = curriculumId;
    data['publishId'] = publishId;
    data['videoName'] = videoName;
    data['videoUrl'] = videoUrl;
    data['title'] = title;
    data['description'] = description;
    data['courseID'] = courseID;
    return data;
  }
}
