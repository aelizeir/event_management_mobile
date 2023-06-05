class User{
  int? id;
  String? name;
  String? email;
  int? studentId;
  String? department;
  String? year_section;
  String? picture;
  String? user_id;
  int? role;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.studentId,
    this.department,
    this.year_section,
    this.picture,
    this.user_id,
    this.role,
    this.token
  });

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      studentId: json['user']['studentId'],
      department: json['user']['department'],
      year_section: json['user']['year_section'],
      picture: json['user']['picture'],
      user_id: json['user']['user_id'],
      role: json['user']['role'],
      token: json['token'],
    );
  }
}