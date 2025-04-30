import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:social_destiny/data/repositories/post/post_repositorie_remote.dart';
import 'package:social_destiny/data/services/app_gateway.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen.dart';
import 'package:social_destiny/ui/postListSceen/post_list_screen_view_model.dart';
import 'package:social_destiny/utils/result.dart';

import 'mockito_config.dart';
import 'post_list_screen_test.mocks.dart';

@GenerateMocks([AppGateway, Posts])
void main() {
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

  testWidgets("should render 3 posts", (WidgetTester tester) async {
    when(
      mockPosts.getPosts(),
    ).thenAnswer((_) async => Result.success(testPosts));

    // Mock para NetworkImage
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: PostListScreen(viewModel: viewModel),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Test post 1'), findsOneWidget);
      expect(find.text('Test post 2'), findsOneWidget);
      expect(find.text('Test post 3'), findsOneWidget);
    });
  });
}
