class SettingModel {
  SettingModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final Data data;

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      success: json["success"] ?? false, // Default to false if not provided
      data: Data.fromJson(json["data"] ?? {}),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.password,
    this.image,
    required this.searchHistory,
    required this.v,
  });

  final String id;
  final String email;
  final String password;
  final String? image; // Nullable field
  final List<String> searchHistory;
  final int v;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["_id"] ?? '', // Fallback to empty string
      email: json["email"] ?? '', // Fallback to empty string
      password: json["password"] ?? '', // Fallback to empty string
      image: json["image"], // Null is acceptable here
      searchHistory: List<String>.from(
          json["searchHistory"] ?? []), // Default to an empty list
      v: json["__v"] ?? 0, // Default to 0
    );
  }
}
