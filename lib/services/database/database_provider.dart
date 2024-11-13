

import 'package:flutter/material.dart';
import 'package:peepster/models/user.dart';

import '../auth/auth_service.dart';
import 'database_service.dart';

class DatabaseProvider extends ChangeNotifier{

  final _auth =AuthService();
  final _db = DatabaseService();

  Future<UserProfile?>userProfile (String uid) => _db.getUserFromFirebase(uid);

  Future<void>updateBio(String bio)=> _db.updateUserBioInFirebase(bio);


}