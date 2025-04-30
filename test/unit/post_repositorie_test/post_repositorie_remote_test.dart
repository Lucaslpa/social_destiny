import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:social_destiny/data/repositories/models/post.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/utils/result.dart';

import 'mockito_config.dart';
import 'post_repositorie_remote_test.mocks.dart';

@GenerateMocks([AppGateway, Posts])
void main() {
  group('PostRepositoryRemote', () {
    late MockAppGateway mockAppGateway;
    late MockPosts mockPosts;

    setUp(() {
      configureMockito();

      mockAppGateway = MockAppGateway();
      mockPosts = MockPosts();
      when(mockAppGateway.postsGateway).thenReturn(mockPosts);
    });

    test("should return a list of posts", () async {
      when(
        mockPosts.getPosts(),
      ).thenAnswer((_) async => Result.success(testPosts));

      final postRepositoryRemote = PostRepositoryRemote(
        appGateway: mockAppGateway,
      );

      final result = await postRepositoryRemote.getPosts();

      expect(result, isA<ApiSuccess>());
      expect((result as ApiSuccess).data, isA<List<Post>>());
      expect((result as ApiSuccess).data.length, testPosts.length);
    });

    test("should return error if getPosts fails", () async {
      when(mockPosts.getPosts()).thenAnswer((_) async => Result.error("error"));

      final postRepositoryRemote = PostRepositoryRemote(
        appGateway: mockAppGateway,
      );

      final result = await postRepositoryRemote.getPosts();

      expect(result, isA<ApiError>());
    });
  });
}
