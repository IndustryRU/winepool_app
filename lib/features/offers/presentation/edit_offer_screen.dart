import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winepool_app/core/presentation/controllers/image_picker_controller.dart';
import 'package:winepool_app/features/offers/application/offers_controller.dart';
import 'package:winepool_app/features/offers/data/offers_repository.dart';
import 'package:winepool_app/features/offers/domain/offer.dart';

class EditOfferScreen extends HookConsumerWidget {
  final Offer offer;
  
  const EditOfferScreen({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: offer.wine?.name ?? offer.id); // Offer не имеет name, использую name вина или id
    final descriptionController = useTextEditingController(text: offer.wine?.description ?? ''); // Offer не имеет description, использую description вина
    final priceController = useTextEditingController(text: offer.price.toString());
    final volumeController = useTextEditingController(text: ''); // Offer не имеет volumeMl
    final strengthController = useTextEditingController(text: ''); // Offer не имеет strengthPercent
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final imageFile = ref.watch(imagePickerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать товар'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Виджет превью изображения
                Container(
                  width: 200,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imageFile != null
                        ? Image.file(File(imageFile.path), fit: BoxFit.cover)
                        : null, // Offer не имеет imageUrl
                  ),
                ),
                const SizedBox(height: 16),
                // Кнопка выбора изображения
                ElevatedButton(
                  onPressed: () {
                    ref.read(imagePickerControllerProvider.notifier).pickImage(ImageSource.gallery);
                  },
                  child: const Text('Выбрать фото'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Название',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите название товара';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Описание',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
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
                  controller: volumeController,
                  decoration: const InputDecoration(
                    labelText: 'Объем (мл)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: strengthController,
                  decoration: const InputDecoration(
                    labelText: 'Крепость (%)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // Загрузка изображения
                      String? imageUrl;
                      final pickedImageFile = ref.read(imagePickerControllerProvider);
                      if (pickedImageFile != null) {
                        imageUrl = await ref.read(offersRepositoryProvider).uploadOfferImage(
                          image: pickedImageFile,
                          offerId: offer.id,
                        );
                      } else {
                        // Если новое изображение не выбрано, imageUrl остается null, так как Offer не имеет imageUrl
                        imageUrl = null;
                      }
   
                      final updatedOffer = Offer(
                        id: offer.id,
                        sellerId: offer.sellerId,
                        wineId: offer.wineId, // wineId не изменяется в этом экране
                        price: double.parse(priceController.text),
                        createdAt: offer.createdAt,
                      );
   
                      // Вызываем и дожидаемся завершения
                      await ref.read(offersControllerProvider.notifier).updateOffer(updatedOffer);
   
                      // Проверяем, что виджет еще жив
                      if (!context.mounted) return;
   
                      // Инвалидируем провайдер, чтобы он обновился
                      ref.invalidate(offersControllerProvider);
   
                      // И только теперь закрываем экран
                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('Сохранить'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}