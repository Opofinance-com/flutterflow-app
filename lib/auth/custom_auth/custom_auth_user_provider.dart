import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class OpoFinanceAuthUser {
  OpoFinanceAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<OpoFinanceAuthUser> opoFinanceAuthUserSubject =
    BehaviorSubject.seeded(OpoFinanceAuthUser(loggedIn: false));
Stream<OpoFinanceAuthUser> opoFinanceAuthUserStream() =>
    opoFinanceAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
