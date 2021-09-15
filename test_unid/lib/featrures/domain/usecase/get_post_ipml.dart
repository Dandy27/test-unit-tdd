import 'package:fpdart/fpdart.dart';
import 'package:test_unid/core/erros/errors.dart';
import 'package:test_unid/core/post_params_dto.dart';
import 'package:test_unid/featrures/domain/repository/post_repository.dart';
import 'package:test_unid/featrures/domain/usecase/get_posts.dart';

class GetPostIpml implements GetPost {
  final PostRepository repository;

  GetPostIpml(this.repository);

  @override
  FuturePostCall call({required PostParamsDto params}) async {
    if (params.page <= 0) {
      return Left(InvalidPostParams('não pode ser menor que 1'));
    }
    return repository.fetchPosts(params);
  }
}
