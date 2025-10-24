import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:winepool_app/features/auth/application/auth_controller.dart';
import 'package:winepool_app/features/offers/application/offers_controller.dart';
import 'package:winepool_app/features/offers/data/offers_repository.dart';
import 'package:winepool_app/features/offers/domain/offer.dart';
import 'package:winepool_app/features/wines/application/wines_controller.dart';
import 'package:winepool_app/features/wines/application/wineries_controller.dart';
import 'package:winepool_app/features/wines/domain/wine.dart';

class AddOfferScreen extends HookConsumerWidget {
  const AddOfferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final priceController = useTextEditingController();
      final vintageController = useTextEditingController();
      final bottleSizeController = useTextEditingController();
      final formKey = useMemoized(() => GlobalKey<FormState>());
      final winesState = ref.watch(allWinesProvider);
      final selectedWine = useState<Wine?>(null);
     
     // Добавляем слушатель для offersMutationProvider
     ref.listen(offersMutationProvider, (previous, next) {
       if (next is AsyncError) {
         // TODO: Показать ошибку пользователю
         print('Ошибка при добавлении предложения: ${next.error}');
       } else if (next is AsyncData && previous is AsyncLoading) {
         // Предложение успешно добавлено, закрываем экран
         if (context.mounted) {
           context.pop();
         }
       }
     });
     
     return Scaffold(
       appBar: AppBar(
         title: const Text('Добавить предложение'),
       ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Form(
           key: formKey,
           child: ListView(
             children: [
               // Отображение вин или информации о выбранном вине
               winesState.when(
                 data: (wines) {
                   if (wines.isEmpty) {
                     return const Padding(
                       padding: EdgeInsets.all(16.0),
                       child: Text('Нет доступных вин. Сначала добавьте вино.'),
                     );
                   }

                   // Если вино еще не выбрано, показываем список
                   if (selectedWine.value == null) {
                     return ListView.builder(
                       shrinkWrap: true,
                       physics: const NeverScrollableScrollPhysics(),
                       itemCount: wines.length,
                       itemBuilder: (context, index) {
                         final wine = wines[index];
                         final wineryId = wine.wineryId;
                         final wineryAsync = ref.watch(fetchWineryByIdProvider(wineryId));
                         return Card(
                           child: ListTile(
                             title: Text(wine.name),
                             subtitle: wineryAsync.when(
                               data: (winery) => Text(winery.name ?? ''),
                               loading: () => const Text('Загрузка...'),
                               error: (error, stack) => Text('Ошибка: $error'),
                             ),
                             trailing: const Icon(Icons.arrow_forward_ios),
                             onTap: () {
                               selectedWine.value = wine;
                             },
                           ),
                         );
                       },
                     );
                   } else {
                     // Если вино выбрано, показываем информацию о вине и поля для ввода
                     final wine = selectedWine.value!;
                     final wineryId = wine.wineryId;
                     final wineryAsync = ref.watch(fetchWineryByIdProvider(wineryId));
                     return wineryAsync.when(
                       data: (winery) => Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           // Информация о выбранном вине
                           Card(
                             child: Padding(
                               padding: const EdgeInsets.all(16.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   if (wine.imageUrl != null && Uri.parse(wine.imageUrl!).isAbsolute)
                                     Container(
                                       width: double.infinity,
                                       height: 200,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(8),
                                         image: DecorationImage(
                                           image: NetworkImage(wine.imageUrl!),
                                           fit: BoxFit.cover,
                                         ),
                                       ),
                                     )
                                   else
                                     Container(
                                       width: double.infinity,
                                       height: 200,
                                       color: Colors.grey[300],
                                       child: const Icon(Icons.wine_bar, size: 50),
                                     ),
                                   const SizedBox(height: 16),
                                   Text(
                                     wine.name ?? '',
                                     style: Theme.of(context).textTheme.titleLarge,
                                   ),
                                   const SizedBox(height: 8),
                                   Text(
                                     winery.name ?? '',
                                     style: Theme.of(context).textTheme.titleMedium,
                                   ),
                                   const SizedBox(height: 8),
                                   if (wine.alcoholLevel != null)
                                     Text('Крепость: ${wine.alcoholLevel}%'),
                                   Text('Цвет: ${wine.color?.name ?? 'N/A'}'),
                                   Text('Сахар: ${wine.sugar?.name ?? 'N/A'}'),
                                   if (wine.description != null)
                                     Text('Описание: ${wine.description ?? ''}'),
                                 ],
                               ),
                             ),
                           ),
                           const SizedBox(height: 16),
                           TextFormField(
                             controller: priceController,
                             decoration: const InputDecoration(
                               labelText: 'Цена',
                               border: OutlineInputBorder(),
                             ),
                             keyboardType: TextInputType.number,
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Пожалуйста, введите цену';
                               }
                               final price = double.tryParse(value);
                               if (price == null || price <= 0) {
                                 return 'Пожалуйста, введите корректную цену';
                               }
                               return null;
                             },
                           ),
                           const SizedBox(height: 16),
                           TextFormField(
                                                         controller: vintageController,
                                                         decoration: const InputDecoration(
                                                           labelText: 'Год урожая',
                                                           border: OutlineInputBorder(),
                                                         ),
                                                         keyboardType: TextInputType.number,
                                                       ),
                                                       const SizedBox(height: 16),
                                                       TextFormField(
                                                         controller: bottleSizeController,
                                                         decoration: const InputDecoration(
                                                           labelText: 'Объем бутылки (л)',
                                                           border: OutlineInputBorder(),
                                                         ),
                                                         keyboardType: TextInputType.number,
                                                       ),
                         ],
                       ),
                       loading: () => const Padding(
                         padding: EdgeInsets.all(16.0),
                         child: Center(child: CircularProgressIndicator()),
                       ),
                       error: (error, stack) => Padding(
                         padding: EdgeInsets.all(16.0),
                         child: Center(child: Text('Ошибка загрузки винодельни: $error')),
                       ),
                     );
                   }
                 },
                 loading: () => const Padding(
                   padding: EdgeInsets.all(16.0),
                   child: Center(child: CircularProgressIndicator()),
                 ),
                 error: (error, stack) => Padding(
                   padding: EdgeInsets.all(16.0),
                   child: Center(child: Text('Ошибка загрузки вин: $error')),
                 ),
               ),
               const SizedBox(height: 24),
               // Кнопка "Сохранить" активна только когда вино выбрано
               ElevatedButton(
                 onPressed: selectedWine.value != null ? () async {
                   if (formKey.currentState!.validate()) {
                     final sellerId = ref.read(authControllerProvider).value?.id;
                     if (sellerId == null) {
                       // Показать ошибку, что пользователь не найден
                       // (хотя этого не должно произойти, если мы на этом экране)
                       return;
                     }
                     const uuid = Uuid();
                     final offerId = uuid.v4();
                     
                     final newOffer = Offer(
                                             id: offerId,
                                             sellerId: sellerId,
                                             wineId: selectedWine.value!.id, // Используем выбранное вино
                                             price: double.parse(priceController.text),
                                             vintage: int.tryParse(vintageController.text),
                                             bottleSize: double.tryParse(bottleSizeController.text),
                                             createdAt: DateTime.now(),
                                           );
           
                     // Вызываем и дожидаемся завершения
                     await ref.read(offersMutationProvider.notifier).addOffer(newOffer);
                   }
                 } : null,
                 style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                 ),
                 child: const Text('Сохранить'),
               ),
             ],
           ),
         ),
       ),
     );
  }
}