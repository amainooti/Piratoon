// user_model.dart
class UserModel {
  final String id;
  final String name;
  final bool isLoggedIn;
  final String? selectedImageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.isLoggedIn,
    this.selectedImageUrl,
  });
}