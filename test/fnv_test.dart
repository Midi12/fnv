import 'dart:convert';

import 'package:fnv/fnv.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('fnv1_32', () {
      expect(fnv1_32(utf8.encode('test')), 0xbc2c0be9);
      expect(fnv1_32_s('test'), 0xbc2c0be9);
    });

    test('fnv1a_32', () {
      expect(fnv1a_32(utf8.encode('test')), 0xafd071e5);
      expect(fnv1a_32_s('test'), 0xafd071e5);
    });
  });
}
