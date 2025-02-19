import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Encryption {
  static final String secretKey = dotenv.env['ENCRYPTION_KEY']!;

  static final encrypt.Key key =
      encrypt.Key.fromUtf8(secretKey.padRight(32, '0').substring(0, 32));

  static String encryptData(Map<String, dynamic> data) {
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));
    final iv = encrypt.IV.fromLength(16); // Generate a random IV

    final jsonString = jsonEncode(data);
    final encrypted = encrypter.encrypt(jsonString, iv: iv);

    // Encode IV + Encrypted Data as Base64
    final encryptedBytes = iv.bytes + encrypted.bytes;
    return base64.encode(encryptedBytes);
  }

  static Map<String, dynamic> decryptData(String encryptedText) {
    try {
      final encryptedBytes = base64.decode(encryptedText);

      if (encryptedBytes.length < 16) {
        throw Exception("Invalid encrypted data.");
      }

      final iv = encrypt.IV(Uint8List.fromList(encryptedBytes.sublist(0, 16)));
      final encryptedPayload = encryptedBytes.sublist(16);

      final encrypter =
          encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

      final decrypted = encrypter.decrypt(
        encrypt.Encrypted(Uint8List.fromList(encryptedPayload)),
        iv: iv,
      );

      return jsonDecode(decrypted);
    } catch (e) {
      throw Exception("Decryption failed: ${e.toString()}");
    }
  }
}
