import 'dart:convert';
import 'dart:math';

import 'fnv_constants.dart';

/// FNV hash algorithm
int _fnv(List<int> bytes, int init, int fnv_prime, int mask) {
  var hash = init;

  var i = 0;
  while (i < bytes.length) {
    hash *= fnv_prime;
    hash ^= bytes[i++];
  }

  return hash & mask;
}

/// FNVA hash algorithm
int _fnva(List<int> bytes, int init, int fnv_prime, int mask) {
  var hash = init;

  var i = 0;
  while (i < bytes.length) {
    hash ^= bytes[i++];
    hash *= fnv_prime;
  }

  return hash & mask;
}

/// FNV-1 32bit hash algorithm
int fnv1_32(List<int> bytes, {int init = FNV1_32_INIT}) {
  return _fnv(bytes, init, FNV_32_PRIME, UINT32_MASK);
}

/// FNV-1 32bit hash algorithm
int fnv1_32_s(String str, {int init = FNV1_32_INIT}) {
  return fnv1_32(utf8.encode(str), init: init);
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32(List<int> bytes, {int init = FNV1A_32_INIT}) {
  return _fnva(bytes, init, FNV_32_PRIME, UINT32_MASK);
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32_s(String str, {int init = FNV1_32_INIT}) {
  return fnv1a_32(utf8.encode(str), init: init);
}

/// FNV-1 64bit hash algorithm
int fnv1_64(List<int> bytes, {int init = FNV1_64_INIT}) {
  return _fnv(bytes, init, FNV_64_PRIME, UINT64_MASK);
}

/// FNV-1 64bit hash algorithm
int fnv1_64_s(String str, {int init = FNV1_64_INIT}) {
  return fnv1_64(utf8.encode(str), init: init);
}

/// FNV-1a 64bit hash algorithm
int fnv1a_64(List<int> bytes, {int init = FNV1A_64_INIT}) {
  return _fnva(bytes, init, FNV_64_PRIME, UINT64_MASK);
}

/// FNV-1a 64bit hash algorithm
int fnv1a_64_s(String str, {int init = FNV1_64_INIT}) {
  return fnv1a_64(utf8.encode(str), init: init);
}