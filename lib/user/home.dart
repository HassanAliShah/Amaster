import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gmaster/global.dart';
import 'package:gmaster/model/database_model.dart';
import 'package:gmaster/reg/login.dart';
import 'package:gmaster/widgets/tasks_list.dart';
import '../screens/family_member_screen.dart';
import '../screens/tasks_screen.dart';
import 'shopping_list.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  getData() async {
    await databaseModel.UserInventryList();
    await databaseModel.UserList();
    await databaseModel.FamilyList();
    await databaseModel.UserShoppingList();
  }

  @override
  initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Center(child: Text('Options')),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                shoppingTask.clear();
                tasks.clear();
                userList.clear();
                familyList.clear();
                fAuth.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
            ),
            ListTile(
              title: const Text('About'),
              leading: Icon(Icons.contact_support_rounded),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskScreen()));
                },
                child: ReusableCard(
                  colour: Colors.redAccent,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.house,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Inventory List',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingList()));
                },
                child: ReusableCard(
                  colour: Colors.redAccent,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.basketShopping,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shopping List',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FamilyMemberScreen()));
                },
                child: ReusableCard(
                  colour: Colors.redAccent,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.peopleGroup,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Family Members',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: ReusableCard(
                  colour: Colors.redAccent,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.person,
                        color: Colors.white,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Search For Agent',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: ReusableCard(
                  colour: Colors.redAccent,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.cartShopping,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shop Now',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardchild});
  final Color colour;
  final Widget? cardchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 150,
      width: 150,
      child: cardchild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
