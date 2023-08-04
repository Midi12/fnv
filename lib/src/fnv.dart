import 'dart:convert';

import 'fnv_algorithm.dart' as adaptive;
import 'fnv_algorithm_full_precision.dart' as full_precision;
import 'fnv_constants.dart';

const bool _kIsWeb = bool.fromEnvironment('dart.library.js_util');

/// FNV-1 32bit hash algorithm
int fnv1_32(List<int> bytes, {int? init}) {
  final initUsed = init != null ? BigInt.from(init) : FNV1_32_INIT;
  return full_precision
      .fnv_bigint(bytes, initUsed, FNV_32_PRIME, UINT32_MASK)
      .toInt();
}

/// FNV-1 32bit hash algorithm
int fnv1_32_s(String str, {int? init}) {
  return fnv1_32(utf8.encode(str), init: init);
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32(List<int> bytes, {int? init}) {
  final initUsed = init != null ? BigInt.from(init) : FNV1A_32_INIT;
  return full_precision
      .fnva_bigint(bytes, initUsed, FNV_32_PRIME, UINT32_MASK)
      .toInt();
}

/// FNV-1a 32bit hash algorithm
int fnv1a_32_s(String str, {int? init}) {
  return fnv1a_32(utf8.encode(str), init: init);
}

void _checkUnsupportedWeb() {
  if (_kIsWeb) {
    throw UnsupportedError(
        'If you need to support the web platform, please use the _bigint method.');
  }
}

/// FNV-1 64bit hash algorithm
int fnv1_64(List<int> bytes, {int? init}) {
  _checkUnsupportedWeb();
  final initUsed = init != null ? BigInt.from(init) : FNV1_64_INIT;
  return full_precision
      .fnv_bigint(bytes, initUsed, FNV_64_PRIME, UINT64_MASK)
      .toInt();
}

/// FNV-1 64bit hash algorithm
int fnv1_64_s(String str, {int? init}) {
  return fnv1_64(utf8.encode(str), init: init);
}

/// FNV-1a 64bit hash algorithm
int fnv1a_64(List<int> bytes, {int? init}) {
  _checkUnsupportedWeb();
  final initUsed = init != null ? BigInt.from(init) : FNV1A_64_INIT;
  return full_precision
      .fnva_bigint(bytes, initUsed, FNV_64_PRIME, UINT64_MASK)
      .toInt();
}

/// FNV-1a 64bit hash algorithm
int fnv1a_64_s(String str, {int? init}) {
  return fnv1a_64(utf8.encode(str), init: init);
}

/// FNV-1 64bit hash algorithm
/// Support for web platforms
BigInt fnv1_64_bigint(List<int> bytes, {BigInt? init}) {
  final initUsed = init ?? FNV1_64_INIT;
  assert(initUsed.bitLength <= 64);
  return adaptive.fnv_bigint(bytes, initUsed, FNV_64_PRIME, UINT64_MASK);
}

/// FNV-1 64bit hash algorithm
/// Support for web platforms
BigInt fnv1_64_s_bigint(String str, {BigInt? init}) {
  return fnv1_64_bigint(utf8.encode(str), init: init);
}

/// FNV-1a 64bit hash algorithm
/// Support for web platforms
BigInt fnv1a_64_bigint(List<int> bytes, {BigInt? init}) {
  final initUsed = init ?? FNV1A_64_INIT;
  assert(initUsed.bitLength <= 64);
  return adaptive.fnva_bigint(bytes, initUsed, FNV_64_PRIME, UINT64_MASK);
}

/// FNV-1a 64bit hash algorithm
/// Support for web platforms
BigInt fnv1a_64_s_bigint(String str, {BigInt? init}) {
  return fnv1a_64_bigint(utf8.encode(str), init: init);
}
