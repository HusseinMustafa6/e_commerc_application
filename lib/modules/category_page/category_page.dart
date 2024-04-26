import 'package:e_commerce/modules/category_page/category_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../my_widgets/product_tile.dart';

CategoryPageController categoryPageController =
Get.put(CategoryPageController());

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage(this.categoryName);




  @override


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Navigator.pop(context);
        categoryPageController.categoryProducts = [];
        },),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white38
                    ),
                    child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,color: Colors.grey[800]),
                )),
                SizedBox(height: 10,),
                Obx((){
                  categoryPageController.fetchProducts(categoryName);
                  if(categoryPageController.isLoading.value &&categoryPageController.categoryProducts.isEmpty){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else {
                    return AlignedGridView.count(crossAxisCount: 2,
                      itemCount: categoryPageController.categoryProducts.length,
                      mainAxisSpacing: 16,
                     crossAxisSpacing: 16,
                     shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                         return ProductTile(
                             categoryPageController.categoryProducts[index]);
                       },
                    );
                   }


                }



                )
              ],
            ),
          ),
        ),
      ),
    );

  }

}
//