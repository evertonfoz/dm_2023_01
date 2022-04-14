import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:shelf_modular/shelf_modular.dart';
import 'package:sixth_server_app/app_module.dart';

SecurityContext getSecurityContext() {
  // Bind with a secure HTTPS connection
  final chain = Platform.script.resolve('certificates/cert.pem').toFilePath();
  final key = Platform.script.resolve('certificates/key.pem').toFilePath();

  return SecurityContext()
    ..useCertificateChain(chain)
    ..usePrivateKey(key, password: 'utfpr');
}

void main() async {
  var server = await serve(
    Modular(module: AppModule()),
    '0.0.0.0',
    4040,
    // securityContext: getSecurityContext(),
  );

  print('${server.address.host}:${server.port}');
}
