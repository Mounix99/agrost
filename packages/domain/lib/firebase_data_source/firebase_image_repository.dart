import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' show extension;

import '../repositories/image_repository.dart';

class FirebaseImageRepositoryImplementation extends ImageRepository {
  late final FirebaseStorage _storage;
  static const plantImagePath = 'image/plants/';

  Reference get storageRef => _storage.ref();

  FirebaseImageRepositoryImplementation(this._storage);

  @override
  Future<Either<String, String?>> uploadPlantImage({required File file, required String fileName}) async {
    final plantImagesRef = storageRef.child("$plantImagePath$fileName.${extension(file.path.toLowerCase())}");
    late String imageUrl;
    try {
      await plantImagesRef.putFile(file).whenComplete(() async => imageUrl = await plantImagesRef.getDownloadURL());
      return Left(imageUrl);
    } on FirebaseException catch (e) {
      return Right(e.toString());
    }
  }
}
