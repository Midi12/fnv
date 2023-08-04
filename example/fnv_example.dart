import 'package:fnv/fnv.dart';

void main() {
  // Returns int, 32-bit precision, full platform support
  print(fnv1a_32_s('foo'));

  // Returns int, 64-bit precision, but does not support web platforms
  print(fnv1a_64_s('foo'));

  // Returns BigInt, 64-bit precision, full platform support
  print(fnv1a_64_s_bigint('foo'));
}
