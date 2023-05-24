import 'dart:io';

import 'package:either_dart/either.dart';

abstract class ImageRepository {
  Future<Either<String, String?>> uploadPlantImage({required File file, required String fileName});
}
