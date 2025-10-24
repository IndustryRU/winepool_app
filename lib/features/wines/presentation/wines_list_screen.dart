import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:winepool_app/features/wines/application/wines_controller.dart';

class WinesListScreen extends ConsumerWidget {
  const WinesListScreen({super.key, required this.wineryId});

  final String wineryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final winesAsync = ref.watch(winesByWineryProvider(wineryId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Вина винодельни'),
      ),
      body: winesAsync.when(
        data: (wines) {
          if (wines.isEmpty) {
            return const Center(child: Text('У этой винодельни пока нет вин.'));
          }
          return ListView.builder(
            itemCount: wines.length,
            itemBuilder: (context, index) {
              final wine = wines[index];
              return ListTile(
                title: Text(wine.name),
                // TODO: Добавить onTap для перехода к деталям вина
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.push(
                          '/wineries/$wineryId/wines/${wine.id}/edit',
                          extra: wine,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: const Text('Удалить вино?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(),
                                child: const Text('Отмена'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // Дожидаемся завершения операции
                                  await ref.read(wineMutationProvider.notifier).deleteWine(wine.id!, wineryId);
                                  
                                  // Инвалидируем список из UI
                                  ref.invalidate(winesByWineryProvider(wineryId));

                                  if (dialogContext.mounted) {
                                    Navigator.of(dialogContext).pop();
                                  }
                                },
                                child: const Text('Удалить', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Ошибка: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/wineries/$wineryId/wines/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}