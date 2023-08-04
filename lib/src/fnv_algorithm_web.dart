/// FNV hash algorithm, Use BigInt
BigInt fnv_bigint(List<int> bytes, BigInt init, BigInt fnv_prime, BigInt mask) {
  var hash = init;

  var i = 0;
  while (i < bytes.length) {
    hash *= fnv_prime;
    hash = hash.toSigned(64);
    hash ^= BigInt.from(bytes[i++]);
    hash = hash.toSigned(64);
  }

  return hash & mask;
}

/// FNVA hash algorithm, Use BigInt
BigInt fnva_bigint(
    List<int> bytes, BigInt init, BigInt fnv_prime, BigInt mask) {
  var hash = init;

  var i = 0;
  while (i < bytes.length) {
    hash ^= BigInt.from(bytes[i++]);
    hash = hash.toSigned(64);
    hash *= fnv_prime;
    hash = hash.toSigned(64);
  }

  return hash & mask;
}
