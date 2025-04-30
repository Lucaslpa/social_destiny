import 'package:mockito/mockito.dart';
import 'package:social_destiny/data/services/models/post_api.dart';
import 'package:social_destiny/utils/result.dart';

// Lista de post para testes - pode ser acessada diretamente nos testes
final List<PostApi> testPosts = [
  PostApi(
    id: '1',
    userId: 1,
    content: 'Test post 1',
    image: 'test1.jpg',
    likes: 10,
    createdAt: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
  ),
  PostApi(
    id: '2',
    userId: 2,
    content: 'Test post 2',
    image: 'test2.jpg',
    likes: 5,
    createdAt: DateTime.now().toIso8601String(),
  ),
];

// Configuração de dummy values para o mockito
void configureMockito() {
  // Usamos a lista testPosts para que seja acessível tanto no provideDummy quanto nos testes
  provideDummy<Result<List<PostApi>>>(Result.success(testPosts));
  provideDummy<Result<PostApi>>(Result.success(testPosts.first));
}
