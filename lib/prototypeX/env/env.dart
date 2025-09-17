import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'assets/.env')
abstract class Env {
  @EnviedField(varName: 'DEV_URL')
  static const String devUrl = _Env.devUrl;
}