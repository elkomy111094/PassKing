class PlanModel {
  PlanModel({
    required this.id,
    required this.name,
    required this.price,
    required this.days,
  });
  late final int id;
  late final String name;
  late final int price;
  late final int days;

  PlanModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['days'] = days;
    return _data;
  }
}