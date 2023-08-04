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

BigInt fnv_bigint(
        List<int> bytes, BigInt init, BigInt fnv_prime, BigInt mask) =>
    BigInt.from(_fnv(bytes, init.toInt(), fnv_prime.toInt(), mask.toInt()));

BigInt fnva_bigint(
        List<int> bytes, BigInt init, BigInt fnv_prime, BigInt mask) =>
    BigInt.from(_fnva(bytes, init.toInt(), fnv_prime.toInt(), mask.toInt()));
