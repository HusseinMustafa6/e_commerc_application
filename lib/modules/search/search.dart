

import 'package:e_commerce/modules/myhome_page/myhome_page.dart';
import 'package:e_commerce/modules/search/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../my_widgets/product_tile.dart';

SearchPageContrller searchPageContrller = Get.put(SearchPageContrller());

class SearchPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
              searchPageContrller.result=[];
              searchPageContrller.searchedProduct ='';
            MyHomePage.currentIndex.value =0;
            Get.offAllNamed('/home');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            children: [
              TextField(
                onChanged:(value){
                  searchPageContrller.searchedProduct = value;
                } ,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2 ,color: Colors.black45 ),
                    borderRadius: BorderRadius.circular(10) ,
                  ),
                  labelText: "Search",
                  hintText: "Enter product name you want to search for...",
                  labelStyle: TextStyle(fontSize: 18 , color: Colors.black45),
                  hintStyle: TextStyle(fontSize: 18 , color: Colors.black54),
                  icon: Icon(Icons.search, color: Colors.black) ,
                ),
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 5,),
              FlatButton(
                  color: Colors.red,
                  onPressed:(){
                    print(searchPageContrller.searchedProduct);
                    searchPageContrller.showOnClick();
                  },
                  child:Text('Search',style: TextStyle(fontSize:18 ,fontWeight:FontWeight.w600,color: Colors.white),) ),
              SizedBox(height: 10,),
              Expanded(
                child: Obx(() {
                  if (searchPageContrller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return AlignedGridView.count(
                      crossAxisCount: 2,
                      itemCount: searchPageContrller.result.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            searchPageContrller.result[index]);
                      },
                    );
                  }
                }),
              )
            ],
          ),
        ),


      ),

    );
  }
}
