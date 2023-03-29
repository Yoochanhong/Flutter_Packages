class Employment {
  String? title;
  String? keySkill;

  Employment({this.title, this.keySkill});

  Employment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    keySkill = json['key_skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['key_skill'] = keySkill;
    return data;
  }
}