import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'models/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes List Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipesFromAsset();
  }

  Future<void> _loadRecipesFromAsset() async {
    try {
      final String jsonStr = await rootBundle.loadString('assets/recipes.json');
      final Map<String, dynamic> data = jsonDecode(jsonStr) as Map<String, dynamic>;
      final List<dynamic> list = data['recipes'] as List<dynamic>? ?? <dynamic>[];
      setState(() {
        _recipes = list.map((e) => Recipe.fromJson(e as Map<String, dynamic>)).toList();
      });
    } catch (e) {
      // If asset loading or parsing fails, keep _recipes empty and print error for debugging
      // In a production app you'd show an error to the user.
      // ignore: avoid_print
      print('Error loading recipes asset: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: _recipes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(recipe.title.isNotEmpty ? recipe.title[0] : '?')),
                  title: Text(recipe.title),
                  subtitle: recipe.description != null ? Text(recipe.description!) : null,
                  onTap: () => _showRecipeDetails(context, recipe),
                );
              },
            ),
    );
  }

  void _showRecipeDetails(BuildContext context, Recipe recipe) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (recipe.description != null) Text(recipe.description!),
            const SizedBox(height: 12),
            const Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...recipe.ingredients.map((ing) => Text('• $ing')),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
