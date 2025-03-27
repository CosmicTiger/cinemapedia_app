import 'package:cinemapedia_app/infrastructure/datasources/local_storage_isar_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider =
    Provider((ref) => LocalStorageRepositoryImpl(LocalStorageIsarDatasource()));
