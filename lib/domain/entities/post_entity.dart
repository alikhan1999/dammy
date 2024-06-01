class PostEntity {
  PostEntity({
    required this.email,
  });
  late final String email;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = email;

    return data;
  }

  Map<String, dynamic> toLoginJson() {
    final data = <String, dynamic>{};
    data['userId'] = email;
    return data;
  }
}
