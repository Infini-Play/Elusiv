import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elusiv/features/authentication/repositories/user_repo.dart';
import 'package:elusiv/features/authentication/domain/models/user.dart';
import 'package:image_picker/image_picker.dart';

final authProvider = StateNotifierProvider<AuthProvider, User?>((ref) {
  final userRepo = ref.watch(userRepositoryProvider);
  return AuthProvider(userRepo);
});

class AuthProvider extends StateNotifier<User?> {
  final UserRepository _userRepo;
  User? get currentUser => state;
  AuthProvider(this._userRepo) : super(null);

  Future<void> createUser(Map<String, dynamic> userData) async {
    try {
      final userJson = await _userRepo.createUser(userData);
      state = User.fromJson(userJson);
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    try {
      final userJson = await _userRepo.updateUser(userId, userData);
      state = User.fromJson(userJson);
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<void> updateUserProfile(String userId, Map<String, dynamic> userData, XFile profileImage) async {
    try {
      final userJson = await _userRepo.updateUserProfile(userId, userData, profileImage);
      state = User.fromJson(userJson);
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  Future<void> verifyUser(String userId) async {
    try {
      await updateUser(userId, {'verified': true});
    } catch (e) {
      print('Error verifying user: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _userRepo.deleteUser(userId);
      state = null;
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  Future<void> authenticateUser(String email, String password) async {
    try {
      final userJson = await _userRepo.authenticateUser(email, password);
      state = User.fromJson(userJson);
    } catch (e) {
      print('Error authenticating user: $e');
    }
  }

  Future<void> requestPasswordReset(String email) async {
    try {
      await _userRepo.requestPasswordReset(email);
    } catch (e) {
      print('Error requesting password reset: $e');
    }
  }

  Future<void> verifyEmail(String token) async {
    try {
      await _userRepo.verifyEmail(token);
    } catch (e) {
      print('Error verifying email: $e');
    }
  }

  Future<bool> isUserAuthenticated() async {
    try {
      final isValid = await _userRepo.isUserAuthenticated();
      return isValid;
    } catch (e) {
      print('Error checking user authentication: $e');
      return false;
    }
  }
}
