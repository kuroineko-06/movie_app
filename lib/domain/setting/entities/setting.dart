class SettingEntities {
  SettingEntities({
    required this.success,
    required this.data,
  });

  final bool success;
  final DataEntities data;
}

class DataEntities {
  DataEntities({
    required this.id,
    required this.email,
    required this.password,
    required this.image,
    required this.searchHistory,
    required this.v,
  });

  final String id;
  final String email;
  final String password;
  final String? image;
  final List<String> searchHistory;
  final int v;
}
