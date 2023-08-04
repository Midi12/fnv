final BigInt FNV1_32_INIT = BigInt.from(0x811c9dc5);
final BigInt FNV1A_32_INIT = FNV1_32_INIT;
final BigInt FNV1_64_INIT = BigInt.parse('0xcbf29ce484222325').toSigned(64);
final BigInt FNV1A_64_INIT = FNV1_64_INIT;

final BigInt FNV_32_PRIME = BigInt.from(0x01000193);
final BigInt FNV_64_PRIME = BigInt.from(0x100000001b3);

final BigInt UINT32_MASK = BigInt.from(0xffffffff);
final BigInt UINT64_MASK = BigInt.parse('0xffffffffffffffff').toSigned(64);
