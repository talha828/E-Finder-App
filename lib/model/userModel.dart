class UserModel {
  Data? data;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    print("==== Creating Model .... ====");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? uuid;
  String? name;
  String? email;
  int? status;
  int? isAdmin;
  String? token;
  Roles? roles;
  List<String>? permissions;

  Data(
      {this.id,
      this.uuid,
      this.name,
      this.email,
      this.status,
      this.isAdmin,
      this.token,
      this.roles,
      this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    isAdmin = json['is_admin'];
    token = json['token'];
    roles = json['roles'] != null ? Roles.fromJson(json['roles']) : null;
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['email'] = email;
    data['status'] = status;
    data['is_admin'] = isAdmin;
    data['token'] = token;
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    data['permissions'] = permissions;
    print("==== Completed .... ====");
    return data;

  }
}

class Roles {
  int? id;
  String? roleName;

  Roles({this.id, this.roleName});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['role_name'] = roleName;
    return data;
  }
}
