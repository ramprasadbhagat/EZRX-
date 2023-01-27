import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> requestPhotoPermission() async =>
      await Permission.photos.request();

  Future<PermissionStatus> requeststoragePermission() async =>
      await Permission.storage.request();
}
