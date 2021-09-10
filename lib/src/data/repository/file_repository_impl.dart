import 'package:jurta_app/src/data/remote/i_file_remote_data_source.dart';
import 'package:jurta_app/src/data/repository/i_file_repository.dart';

class FileRepositoryImpl implements IFileRepository{
  FileRepositoryImpl(this.remote);

  final IFileRemoteDataSource remote;

  @override
  Future<void> preview(String uuid) async {
    await remote.preview(uuid);
  }

}