import 'dart:convert';

import 'package:fnv/fnv.dart';
import 'package:test/test.dart';

// use ```flutter test --platform chrome .\test\fnv_bigint_test.dart```
void main() {
  group('A group of tests for bigint', () {
    test('normal method unsupported web platform', () {
      expect(() => fnv1_64_s(''), throwsA(isA<UnsupportedError>()));
      expect(() => fnv1a_64_s(''), throwsA(isA<UnsupportedError>()));
    });

    test('fnv1_64', () {
      expect(fnv1_64_bigint(utf8.encode('test')),
          BigInt.parse('0x8c093f7e9fccbf69').toSigned(64));
      expect(fnv1_64_s_bigint('test'),
          BigInt.parse('0x8c093f7e9fccbf69').toSigned(64));
    });

    test('fnv1a_64', () {
      expect(fnv1a_64_bigint(utf8.encode('test')),
          BigInt.parse('0xf9e6e6ef197c2b25').toSigned(64));
      expect(fnv1a_64_s_bigint('test'),
          BigInt.parse('0xf9e6e6ef197c2b25').toSigned(64));
    });

    test('error init hash', () {
      expect(
          () =>
              fnv1a_64_s_bigint('', init: BigInt.parse('0x1ffffffffffffffff')),
          throwsA(isA<AssertionError>()));
    });
  });
}
