import 'package:e_commerce/modules/category_page/category_page.dart';
import 'package:e_commerce/modules/myhome_page/cart_page/shopping_cart.dart';
import 'package:e_commerce/modules/myhome_page/categories/categories.dart';
import 'package:e_commerce/modules/myhome_page/favorite_page/my_favorite.dart';
import 'package:e_commerce/modules/myhome_page/products_home/products_home.dart';
import 'package:e_commerce/modules/myhome_page/user_profile/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<ListTile> drawerContent = <ListTile>[
  ListTile(
    leading: Icon(Icons.gamepad),
    title: Text(
      'Games',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.checkroom_rounded),
    title: Text(
      'Wearings',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.kitchen),
    title: Text(
      'Refrigerator',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.ad_units),
    title: Text(
      'Phones',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.tv),
    title: Text(
      'Televisions',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.mouse),
    title: Text(
      'Accessory',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.computer),
    title: Text(
      'Hardware',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.headset),
    title: Text(
      'Earphones',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.local_laundry_service_outlined),
    title: Text(
      'Washers',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.sports_esports),
    title: Text(
      'Consoles',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.watch),
    title: Text(
      'Watches',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.tablet),
    title: Text(
      'Taplets',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
  ListTile(
    leading: Icon(Icons.face_retouching_natural),
    title: Text(
      'Makeup',
      style: TextStyle(fontSize: 18),
    ),
    minLeadingWidth: 10,
    onTap: () {},
  ),
];

// categoryPageController.dipose();
class MyHomePage extends StatelessWidget {
  static var currentIndex = 0.obs;

  List<Widget> navBarWidgets = [
    ProductsHome(),
    MyFavorite(),
    ShoppingCart(),
    UserProfile()
  ];

  //shoppingCartController


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Avilable Categories',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.laptop),
                      title: Text(
                        'Laptops',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoryPage('Laptops');
                        }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.gamepad),
                      title: Text(
                        'Games',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Games');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.checkroom_rounded),
                      title: Text(
                        'Wearings',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Wearings');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.kitchen),
                      title: Text(
                        'Refrigerator',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Refrigerator');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.ad_units),
                      title: Text(
                        'Phones',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Phones');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.tv),
                      title: Text(
                        'Televisions',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Televisions');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.mouse),
                      title: Text(
                        'Accessory',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Accessory');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.computer),
                      title: Text(
                        'Hardware',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Hardware');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.headset),
                      title: Text(
                        'Earphones',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Earphones');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.local_laundry_service_outlined),
                      title: Text(
                        'Washers',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Washers');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_esports),
                      title: Text(
                        'Consoles',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Consoles');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.watch),
                      title: Text(
                        'Watches',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Watches');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.tablet),
                      title: Text(
                        'Taplets',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Taplets');
                            }));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text(
                        'Books',
                        style: TextStyle(fontSize: 18),
                      ),
                      minLeadingWidth: 10,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return CategoryPage('Books');
                            }));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[100],
        title: Center(
          child: Text('OneForAll',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Triforce', fontSize: 28)),
        ),
        actions: [IconButton(onPressed:(){Get.offAllNamed('search_page');}, icon:Icon(Icons.search ,size: 33,))],
      ),
      body: Obx(() => navBarWidgets[currentIndex.value]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex.value,
          onTap: (index) {
            currentIndex.value = index;
            print(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }),
    );
  }
}
