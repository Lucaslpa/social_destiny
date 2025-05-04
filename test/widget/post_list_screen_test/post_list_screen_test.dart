import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/data/services/models/post_api.dart';
import 'package:social_destiny/ui/post_list/post_list_screen.dart';
import 'package:social_destiny/ui/post_list/post_list_screen_view_model.dart';
import 'package:social_destiny/utils/result.dart';

import 'mockito_config.dart';
import 'post_list_screen_test.mocks.dart';

@GenerateMocks([AppGateway, Posts])
void main() {
  group('PostListScreen', () {
    late MockAppGateway mockAppGateway;
    late MockPosts mockPosts;
    late PostRepositoryRemote postRepositoryRemote;
    late PostListScreenViewModel viewModel;

    setUp(() {
      configureMockito();
      mockAppGateway = MockAppGateway();
      mockPosts = MockPosts();
      when(mockAppGateway.postsGateway).thenReturn(mockPosts);
      postRepositoryRemote = PostRepositoryRemote(appGateway: mockAppGateway);
      viewModel = PostListScreenViewModel(
        postRepositoryRemote: postRepositoryRemote,
      );
    });

    void fixtureSetup(
      WidgetTester tester,
      Future<void> Function() callback,
    ) async {
      when(
        mockPosts.getPosts(),
      ).thenAnswer((_) async => Result.success(testPosts));

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            title: 'Flutter Demo',
            home: PostListScreen(viewModel: viewModel),
          ),
        );
        await tester.pumpAndSettle();
        await callback();
      });
    }

    testWidgets("should render 3 posts", (WidgetTester tester) async {
      fixtureSetup(tester, () async {
        expect(find.text('Test post 1'), findsOneWidget);
        expect(find.text('Test post 2'), findsOneWidget);
        expect(find.text('Test post 3'), findsOneWidget);
      });
    });

    testWidgets("should like a post", (WidgetTester tester) async {
      when(
        mockPosts.updatePost(any),
      ).thenAnswer((_) async => Result.success(null));

      fixtureSetup(tester, () async {
        await tester.tap(find.byIcon(Icons.favorite).first);
        await tester.pumpAndSettle();

        final postApi = testPosts.first.copyWith(
          likes: testPosts.first.likes + 1,
        );

        verify(
          mockPosts.updatePost(
            argThat(
              predicate<PostApi>(
                (post) => post.id == postApi.id && post.likes == postApi.likes,
              ),
            ),
          ),
        ).called(1);
        expect(find.text(postApi.likes.toString()), findsOneWidget);
      });
    });
  });
}
