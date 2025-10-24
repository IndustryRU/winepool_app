import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:winepool_app/features/orders/application/orders_controller.dart';
import 'package:winepool_app/features/orders/domain/order.dart';

class MySalesScreen extends ConsumerWidget {
  const MySalesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mySalesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои Заказы'),
      ),
      body: state.when(
        data: (orders) => ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return ExpansionTile(
              title: Text(
                'Заказ #${order.id}\nСтатус: ${order.status ?? 'неизвестен'}\n${order.createdAt.toString()}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              children: [
                ListTile(
                  title: Text('Пользователь: ${order.userId ?? 'неизвестен'}'),
                ),
                ...order.items
                        ?.map((item) => ListTile(
                              title: Text(item.offer!.id), // Использую ID, так как Offer не имеет name
                              subtitle: Text(
                                  'Цена: ${item.quantity ?? 0} x ${(item.offer!.price ?? 0)} = ${((item.quantity ?? 0) * (item.offer!.price ?? 0))} руб.'),
                            ))
                        .toList() ??
                    [],
              ],
            );
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Ошибка: $error'),
        ),
      ),
    );
  }
}