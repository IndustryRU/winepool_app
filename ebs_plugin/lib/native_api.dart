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
@HostApi()
abstract class NativeHostApi {
  // Здесь будут методы для взаимодействия с нативным кодом
}