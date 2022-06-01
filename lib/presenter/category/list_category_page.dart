import 'package:flutter/material.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({Key? key}) : super(key: key);

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Categorias'),
      ),
      body: Column(
        children: [
          Text("data"),
          Expanded(
            child: ListView.builder(itemBuilder: (_, id) {
              return ListTile(
                title: Text("Item $id"),
              );
            }),
          )
        ],
      ),
    );
  }
}
