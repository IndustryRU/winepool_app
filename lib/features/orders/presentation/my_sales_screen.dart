import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:winepool_app/features/orders/application/orders_controller.dart';
import 'package:winepool_app/features/orders/domain/order.dart';

class MySalesScreen extends ConsumerWidget {
  const MySalesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySalesAsync = ref.watch(mySalesProvider);

    return mySalesAsync.when(
      data: (orders) {
        if (orders.isEmpty) {
          return const Center(child: Text('У вас пока нет продаж.'));
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return OrderCard(order: order); // Используем тот же OrderCard
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Ошибка: $error')),
    );
  }
}

// Этот виджет можно будет вынести в общий файл, если он еще не там
class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final formattedDate = order.createdAt != null
        ? DateFormat('dd.MM.yyyy HH:mm').format(order.createdAt!)
        : 'Дата неизвестна';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text('Заказ от $formattedDate'),
        subtitle: Text('Статус: ${order.status}'),
        trailing: Text('${order.totalPrice} ₽'), // Используем totalPrice
        onTap: () {
          // TODO: Навигация на детали заказа
        },
      ),
    );
  }
}