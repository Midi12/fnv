import 'dart:convert';
import 'dart:math';

import 'fnv_constants.dart';

/// FNV hash algorithm
int _fnv(List<int> bytes, int init, int fnv_prime, int hash_size) {
  var hash = init;

  for (var i = 0; i < bytes.length; i++) {
    hash = (hash * fnv_prime) % hash_size;
    hash = hash ^ bytes[i];
  }

  return hash;
}

/// FNVA hash algorithm
int _fnva(List<int> bytes, int init, int fnv_prime, int hash_size) {
  var hash = init;

  for (var i = 0; i < bytes.length; i++) {
    hash = hash ^ bytes[i];
    hash = (hash * fnv_prime) % hash_size;
  }

  return hash;
}

/// FNV-1 32bit hash algorithm
int fnv1_32(List<int> bytes, {int init = FNV1_32_INIT}) {
  return _fnv(bytes, init, FNV_32_PRIME, pow(2, 32).toInt());
}

/// FNV-1 32bit hash algorithm
int fnv1_32_s(String str, {int init = FNV1_32_INIT}) {
  return fnv1_32(utf8.encode(str), init: init);
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32(List<int> bytes, {int init = FNV1A_32_INIT}) {
  return _fnva(bytes, init, FNV_32_PRIME, pow(2, 32).toInt());
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32_s(String str, {int init = FNV1_32_INIT}) {
  return fnv1a_32(utf8.encode(str), init: init);
}
