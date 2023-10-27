import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> requestPhotoPermission() async =>
      await Permission.photos.request();

  Future<PermissionStatus> requestStoragePermission() async =>
      await Permission.storage.request();

  Future<PermissionStatus> requestExternalStoragePermission() async =>
      await Permission.manageExternalStorage.request();

  Future<PermissionStatus> requestCameraPermission() async =>
      await Permission.camera.request();
}
