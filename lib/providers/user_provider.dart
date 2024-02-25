// user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:piratoon/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser({
    required bool isLoggedIn,
    String? selectedImageUrl,
    String? id,
    String? name,
  }) {
    final uuid = Uuid();

    _user = UserModel(
      id: id ?? uuid.v4(),
      name: name ?? "John Doe", // Provide a default name or use a stored one
      isLoggedIn: isLoggedIn,
      selectedImageUrl: selectedImageUrl,
    );
    notifyListeners();
  }
}
