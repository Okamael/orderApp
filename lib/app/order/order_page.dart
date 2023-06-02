import 'package:flutter/material.dart';
import 'package:order_app/app/order/orders.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.email))],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Consumer<Orders>(
                builder: (context, ordem, child) => ListView.builder(
                      itemCount: ordem.itemsCount,
                      itemBuilder: (context, index) => Card(
                          child: ListTile(
                              title: Text(ordem.products[index].name))),
                    )),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Enviar Pedido'))
        ],
      ),
    );
  }
}
