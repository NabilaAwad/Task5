import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task5/app/modules/home/views/responsiveWidgets.dart';

class Detailes extends GetxController {
  final box = GetStorage();
  final RxList<String> comment = <String>[].obs;
  var commentC = TextEditingController();
  late String currentProductId;


  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onClose() {
    commentC.dispose();
    super.onClose();
  }


  void loadComments(String productId) {
    currentProductId = productId;
    final savedComments = box.read<List>('comments_$productId') ?? [];
    comment.assignAll(savedComments.cast<String>());
  }


  void saveComment(String newComment) {
    comment.add(newComment);
    box.write('comments_$currentProductId', comment);
    print('Saved comments for $currentProductId: ${box.read('comments_$currentProductId')}');
  }
}
