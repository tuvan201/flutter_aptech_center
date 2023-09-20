import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Session 3',
      home: MyStatefulWidget(),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex =0;

  final Widget _myContact = const MyContact();
  final Widget _myEmail =const MyEmail();
  final Widget _myProfile =const MyProfile();
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  } 

  Widget getBody(){
    if(_selectedIndex == 0){
      return _myContact;
    } 
    else if(_selectedIndex ==1){
      return _myEmail;
    }
    else{
      return _myProfile;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar Example"),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: "Contact",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.email),
            label: 'Email', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            ),
        ],
        onTap: (int index){
          _onItemTapped(index);
        },
      ),
    );
  }
}

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Contact"),);
  }
}

class MyEmail extends StatelessWidget {
  const MyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Email"),);
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Profile"),);
  }
}