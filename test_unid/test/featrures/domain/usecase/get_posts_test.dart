import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_unid/featrures/domain/entities/post.dart';
import 'package:test_unid/core/post_params_dto.dart';
import 'package:test_unid/core/erros/errors.dart';
import 'package:fpdart/src/either.dart';
import 'package:test_unid/featrures/domain/repository/post_repository.dart';
import 'package:test_unid/featrures/domain/usecase/get_post_ipml.dart';

typedef FuturePostCall = Future<Either<PostExeception, List<Post>>>;

class PostRepositoryMock extends Mock implements PostRepository {}

void main() {
  final repository = PostRepositoryMock();
  final usecase = GetPostIpml(repository);
  test('deve retornar uma lista de post', () async {
    //Arrange
    final params = PostParamsDto(page: 1);
    when(() => repository.fetchPosts(params))
        .thenAnswer((_) async => const Right(<Post>[]));
    //Act
    final result = await usecase.call(params: params);
    //Assert
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<Post>>());
  });

  test('deve retornar um PostExecption quando o repository falhar ', () async {
    //Arrange
    final params = PostParamsDto(page: 1);
    when(() => repository.fetchPosts(params)).thenAnswer(
        (_) async => Left(PostRepositoryException('repository error')));
    //Act
  });

  test('deve dar erro se a page for menor 1', () async {
    //Arrange
    final params = PostParamsDto(page: 0);
    //Act
    final result = await usecase.call(params: params);
    //Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });

  test('deve dar erro se a offset for menor 1', () async {
    //Arrange
    final params = PostParamsDto(page: 1, offset: 0);
    //Act
    final result = await usecase.call(params: params);
    //Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidPostParams>());
  });
}
