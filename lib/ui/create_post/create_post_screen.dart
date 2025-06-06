import 'package:flutter/material.dart';
import 'package:social_destiny/ui/create_post/create_poast_view_model.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key, required this.createPostViewModel});
  final CreatePostViewModel createPostViewModel;
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isLoading = true; // Simulação de carregamento
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Postagem'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Implementar lógica para salvar postagem
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                maxLength: 200,
                maxLines: 3,
                validator:
                    (value) =>
                        value?.isEmpty == true ? 'Campo obrigatório' : null,
                decoration: InputDecoration(
                  labelText: 'Conteúdo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                validator:
                    (value) =>
                        value?.isEmpty == true ? 'Campo obrigatório' : null,
                decoration: InputDecoration(
                  labelText: 'Imagem (URL)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Exibir carregando se necessário
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Validar e criar postagem
                    final content = _contentController.text;
                    final imageUrl = _imageUrlController.text;
                    createPostViewModel.createPostCommand.execute(
                      CreatePostArgs(content: content, urlImg: imageUrl),
                    );
                  }
                  // Implementar lógica para criar postagem
                },
                child: AnimatedBuilder(
                  animation: createPostViewModel.createPostCommand,
                  builder: (context, child) {
                    return createPostViewModel.createPostCommand.running
                        ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            value: null, // Exibir carregando se necessário
                            strokeWidth: 2.0,
                            backgroundColor: Colors.purple,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                        : Text('Criar Postagem');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
