import 'package:flutter/material.dart';


void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter demo form',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final formStateKey = GlobalKey<FormState>();
  User user = User.empty(); 

  void saveName(String? inputName){
    user.name = inputName!;
  }

  void saveAge(String? inputAge){
    user.age = int.parse(inputAge!);
  }

  void submitForm(){
    //khi form gọi hàm validate thì tất cả các TextFormField sẽ gọi hàm validator
    //đây là lí do tại sao cần sử dụng widget Form để kiểm tra input user
    if(formStateKey.currentState!.validate()){ //thành công trả về true thất bại trả về false
      print('Form is valid');
      formStateKey.currentState!.save(); //khi form gọi hàm save tất cả các textformfield sẽ gọi hàm onSaved
      print('Sau khi save: tên: ${user.name} và tuổi ${user.age}');
    }
    else{
      print("validate thất bại. Vui lòng thử lại");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter demo form'),
      ),
      body: Form(
        key: formStateKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration:const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
              validator: validateName,
              onSaved: saveName,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText:'Age',
                hintText: 'Enter your age' 
              ),
              validator: validateAge,
              onSaved: saveAge,
            ),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 8,
              backgroundColor: Colors.blue,
            ),
             child: Text('Submit'),
             onPressed: submitForm,
           ),
           
          ],
        ),
        ),
    );
  }
}

 String? validateName(String? inputName){
  if(inputName!.isEmpty){
    //String khác null đồng nghĩa là validate trả về một thông báo lỗi, đây cũng chính là nội dung thông báo lỗi
    return 'tên không được để trống';
  }else{
    //String trả về null đồng nghĩa validate thành công
    return null;
  }
}

String? validateAge(String? inputAge){
  try {
    if(int.tryParse(inputAge!)! < 18){
      //Nếu user nhập 1 số bé hơn 18 thì hiển lỗi này
      return 'tuổi phải từ 18 tuổi trở lên';
    }
    else{
      //validate thành công
      return null;
    }
  } catch (e) {
    //nếu người dùng nhập chữ hàm tryParse không thể ép kiểu được
    return 'phải nhập số';
  }
}

class User {
  User({required this.name, required this.age});

    User.empty()
      : name = '',
        age = 0;

  String name;
  int age;
}




