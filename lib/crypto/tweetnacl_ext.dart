part of pinenacl.api.crypto.tweetnacl;

/// TweetNaCl's extension class.
/// Following the TweetNaCl convention and added some extras.
class TweetNaClExt {
  // HMAC bytes
  static const hmacBytes = 64;

  // Extended secret key's length
  static const int extendedSecretKeyLength = 32;

  static int _crypto_auth(Uint8List out, Uint8List m, Uint8List k) {
    HmacSha512.mac(out, m, k);
    return 0;
  }

  static int crypto_auth(Uint8List out, Uint8List m, Uint8List k) {
    return _crypto_auth(out, m, k);
  }

  static int _crypto_auth_verify(Uint8List h, Uint8List m, Uint8List k) {
    Uint8List x = Uint8List(hmacBytes);
    _crypto_auth(x, m, k);
    return _crypto_verify_64(h, 0, x, 0);
  }

  static int _crypto_auth_verify_len(Uint8List h, Uint8List m, Uint8List k) {
    return _crypto_auth_verify(h, m, k);
  }

  static int crypto_auth_verify(Uint8List h, Uint8List m, Uint8List k) {
    return _crypto_auth_verify_len(h, m, k);
  }

  static int _crypto_verify_64(
      Uint8List x, final int xoff, Uint8List y, final int yoff) {
    return TweetNaCl._vn(x, xoff, y, yoff, 64);
  }

  static int scalar_base(Uint8List pk, Uint8List sk) {
    List<List<Int64>> p = List<List<Int64>>(4);

    p[0] = List<Int64>(16);
    p[1] = List<Int64>(16);
    p[2] = List<Int64>(16);
    p[3] = List<Int64>(16);

    TweetNaCl._scalarbase(p, sk, 0);
    TweetNaCl._pack(pk, p);

    return 0;
  }
}
