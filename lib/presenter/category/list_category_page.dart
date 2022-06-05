import 'package:ecommerce_app/presenter/category/events/list_category_event.dart';
import 'package:ecommerce_app/presenter/category/list_category_bloc.dart';
import 'package:ecommerce_app/presenter/category/states/list_category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({Key? key}) : super(key: key);

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  final listCategoryBloc = Modular.get<ListCategoryBloc>();

  @override
  Widget build(BuildContext context) {
    listCategoryBloc.add(init());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Categorias'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: listCategoryBloc.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<ListCategoryState> snapshot) {
                final state = listCategoryBloc.state;
                if (state is ListStart) {
                  return const Center(child: Text("Inicio"));
                }
                if (state is ListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ListError) {
                  String erroPadrao = "Tivemos um problema";
                  String erro = state.erro.message ?? erroPadrao;
                  return Center(child: Text(erro));
                }
                if (state is ListSuccess) {
                  final list = state.list;
                  return Center(
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (_, id) {
                            final item = list[id];

                            return ListTile(
                                title: Text(item.name),
                                subtitle: Text(item.slug));
                          }));
                }

                return const Text("Item ");
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    listCategoryBloc.close();
  }
}
