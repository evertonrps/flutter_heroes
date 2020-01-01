import 'dart:convert';
import 'package:crypto/crypto.dart';

class Helper {
  String publicKey = "a3bce38014c82bc8bc6e39f7580d8c5f";
  String privateKey = "a3c65339f34db1c869f54fc59e86f359541e7b9c";
  String baseURL = "http://gateway.marvel.com/v1/public/";

  //Helper() {}
  String gerarHash(String ts, String publicKey, String privateKey) {
    return md5.convert(utf8.encode(ts + privateKey + publicKey)).toString();
  }
}
