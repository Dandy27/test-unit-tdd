import 'package:fpdart/fpdart.dart';
import 'package:test_unid/core/erros/errors.dart';
import 'package:test_unid/core/post_params_dto.dart';
import 'package:test_unid/featrures/domain/entities/post.dart';

typedef FuturePostCall = Future<Either<PostExeception, List<Post>>>;

abstract class GetPost {
  FuturePostCall call({required PostParamsDto params});
}

