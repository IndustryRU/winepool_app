import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    input: 'lib/native_api.dart',
    dartOut: 'lib/native_api.g.dart',
    swiftOut: 'ios/Classes/NativeApi.g.swift',
    javaOut: 'android/src/main/java/ru/example/app/NativeApi.java',
    javaOptions: JavaOptions(
      package: 'ru.example.app',
    ),
    dartPackageName: 'ebs_plugin',
  ),
)
class EbsResultData {
  EbsResultData(
    this.isError,
    this.secret,
    this.errorString,
  );

  final String? secret;
  final String? errorString;
  final bool isError;
}

@HostApi()
abstract class NativeHostApi {
  @async
  bool isInstalledApp();

  @async
  String getAppName();

  @async
  String getRequestInstallAppText();

  @async
  bool requestInstallApp();

  @async
  EbsResultData requestVerification(
    String infoSystem,
    String adapterUri,
    String sid,
    String dboKoUri,
    String dbkKoPublicUri,
  );
}