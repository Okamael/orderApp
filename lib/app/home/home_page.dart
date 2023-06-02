import 'package:flutter/material.dart';
import 'package:order_app/app/data/products.dart';
import 'package:order_app/app/order/orders.dart';
import 'package:order_app/utils/appRoutes.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  addOrderProduct(List<Product> produtos) {
    final produtoselecionados =
        produtos.where((element) => element.selected == true);

    produtoselecionados.forEach((element) {
      Provider.of<Orders>(context, listen: false).addProduct(element);
    });

    Navigator.of(context).pushNamed(AppRoutes.ORDER_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    final listProduct = productList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invicta Pedidos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ORDER_PAGE);
              },
              icon: const Icon(Icons.add_circle))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text(listProduct[index].name),
                      trailing: Checkbox(
                        value: listProduct[index].selected,
                        onChanged: (value) {
                          setState(() {
                            listProduct[index].changeSelectedState();
                          });
                        },
                      )),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addOrderProduct(listProduct);
              },
              child: Text('Efetuar pedido'))
        ],
      ),
    );
  }
}
