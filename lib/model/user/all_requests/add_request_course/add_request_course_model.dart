class AddRequestCourseModel {
  AddRequestCourseModel({
    required this.id,
    required this.course,
    required this.groups,
    required this.status,
    required this.certificated,
    required this.certificateSignedAt,
    required this.certificatePath,
    required this.createdAt,
  });
  late final int id;
  late final Course course;
  late final List<Groups> groups;
  late final int status;
  late final bool certificated;
  late final String certificateSignedAt;
  late final String certificatePath;
  late final String createdAt;

  AddRequestCourseModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    course = Course.fromJson(json['course']);
    groups = List.from(json['groups']).map((e)=>Groups.fromJson(e)).toList();
    status = json['status'];
    certificated = json['certificated'];
    certificateSignedAt = json['certificate_signed_at'];
    certificatePath = json['certificate_path'];
    createdAt = json['created_at'];
  }
}

class Course {
  Course({
    required this.id,
    required this.name,
    required this.content,
    required this.type,
    required this.image,
    required this.numberOfHours,
    required this.price,
    required this.provider,
  });
  late final int id;
  late final String name;
  late final String content;
  late final int type;
  late final String image;
  late final int numberOfHours;
  late final String price;
  late final ProviderAddRequestCourse provider;

  Course.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    content = json['content'];
    type = json['type'];
    image = json['image'];
    numberOfHours = json['number_of_hours'];
    price = json['price'];
    provider = ProviderAddRequestCourse.fromJson(json['provider']);
  }
}

class ProviderAddRequestCourse {
  ProviderAddRequestCourse({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
  });
  late final int id;
  late final String title;
  late final String firstName;
  late final String lastName;

  ProviderAddRequestCourse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
}

class Groups {
  Groups({
    required this.id,
    required this.startFrom,
    required this.start,
    required this.end,
    required this.durationInMonths,
  });
  late final int id;
  late final String startFrom;
  late final Start start;
  late final End end;
  late final int durationInMonths;

  Groups.fromJson(Map<String, dynamic> json){
    id = json['id'];
    startFrom = json['start_from'];
    start = Start.fromJson(json['start']);
    end = End.fromJson(json['end']);
    durationInMonths = json['durationInMonths'];
  }
}

class Start {
  Start({
    required this.date,
    required this.dayOfWeek,
    required this.times,
  });
  late final String date;
  late final String dayOfWeek;
  late final List<String> times;

  Start.fromJson(Map<String, dynamic> json){
    date = json['date'];
    dayOfWeek = json['dayOfWeek'];
    times = List.castFrom<dynamic, String>(json['times']);
  }
}

class End {
  End({
    required this.date,
    required this.dayOfWeek,
    required this.times,
  });
  late final String date;
  late final String dayOfWeek;
  late final List<String> times;

  End.fromJson(Map<String, dynamic> json){
    date = json['date'];
    dayOfWeek = json['dayOfWeek'];
    times = List.castFrom<dynamic, String>(json['times']);
  }
}
