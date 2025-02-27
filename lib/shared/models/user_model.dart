class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.errors,
    required this.data,
    required this.token,
  });
  late final int status;
  late final String message;
  late final List<dynamic> errors;
  late final User data;
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    errors = List.castFrom<dynamic, dynamic>(json['errors']);
    data = User.fromJson(json['data']);
    token = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['errors'] = errors;
    _data['data'] = data.toJson();
    _data['api_token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.store,
    required this.haveNotifications,
    required this.notificationsCount,
    required this.activePlan,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String avatar;
  late final Store store;
  late final bool haveNotifications;
  late final int notificationsCount;
  late final bool activePlan;

  User.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    store = Store.fromJson(json['store']);
    haveNotifications = json['have_notifications'];
    notificationsCount = json['notifications_count'];
    activePlan = json['activePlan'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['avatar'] = avatar;
    _data['store'] = store.toJson();
    _data['have_notifications'] = haveNotifications;
    _data['notifications_count'] = notificationsCount;
    _data['activePlan'] = activePlan;
    return _data;
  }
}

class Store {
  Store({
    required this.id,
    required this.name,
    required this.rate,
    required this.hasMenu,
    required this.hasBooking,
    required this.image,
  });
  late final int id;
  late final String name;
  late final int rate;
  late final bool hasMenu;
  late final bool hasBooking;
  late final String image;

  Store.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    rate = json['rate'];
    hasMenu = json['has_menu'];
    hasBooking = json['has_booking'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['rate'] = rate;
    _data['has_menu'] = hasMenu;
    _data['has_booking'] = hasBooking;
    _data['image'] = image;
    return _data;
  }
}