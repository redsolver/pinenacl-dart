library pinenacl.utils;

import 'dart:typed_data';
import 'package:pinenacl/api.dart';

/// Utils class, provides secure randomnes and basic
/// list functions.
class Utils {
  static Uint8List randombytes(int len) {
    return TweetNaCl.randombytes(len);
  }

  static void listCopy(Uint8List from, Uint8List to, [int toOffset = 0]) {
    for (int i = 0; i < from.length; i++) {
      to[i + toOffset] = from[i];
    }
  }

  static void listZero(List list) {
    for (int i = 0; i < list.length; i++) {
      list[i] = 0;
    }
  }
}
