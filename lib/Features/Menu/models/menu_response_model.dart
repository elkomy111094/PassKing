class MenusResponseModel {
  MenusResponseModel({
    required this.status,
    required this.message,
    required this.errors,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<dynamic> errors;
  late final List<MenuModel> data;

  MenusResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    data = List.from(json['data']).map((e)=>MenuModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['errors'] = errors;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MenuModel {
  MenuModel({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  MenuModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}