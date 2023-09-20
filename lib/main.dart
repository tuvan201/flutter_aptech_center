import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  User({required this.name, required this.mobile, required this.email});

  User.empty()
      : name = '',
        mobile = '',
        email = '';

  String name;
  String mobile;
  String email;
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  //tạo class user lưu trữ thông tin
  User user = User.empty();

  void submitInput() {
    //trả về true nếu valid thành công ngược lại thì false
    if (_formKey.currentState!.validate()) {   //khi form gọi hàm validate thì tất cả các TextFormField trong form sẽ đồng loại gọi hàm validator
      _formKey.currentState!.save(); //khi form gọi hàm save thì tất cả các TextFormField trong form sẽ đồng loạt gọi hàm onSaved
      _messengerKey.currentState!.showSnackBar(
       const SnackBar(content: Text('Processing Data')),
      );
      print("thông tin người dùng:\n tên: ${user.name}\n mobile:${user.mobile} \n email: ${user.email}");
    } else {
      _messengerKey.currentState!.showSnackBar(
       const SnackBar(content: Text('Please fix the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Form Validation Example'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Name cannot be empty';
            }
            if (value.length < 3) {
              return 'Name must be more than 2 characters';
            }
            return null;
          },
          onSaved: (String? val) {
            // Save the form data
            user.name = val!;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          validator: (String? value) {
            // Mobile validation logic
            try {
              if (value!.length < 10) {
                //Nếu user nhập 1 số đt ít hơn 10 thì hiển lỗi này
                return 'sdt không hợp lệ';
              } else {
                //validate thành công
                return null;
              }
            } catch (e) {
              //nếu người dùng nhập chữ hàm tryParse không thể ép kiểu được
              return 'phải nhập số';
            }
          },
          onSaved: (String? val) {
            // Save the form data
            user.mobile = val!;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Email cannot be empty';
            }
            if (value.length < 3) {
              return 'Email must be more than 2 characters';
            }
            return null;
          },
          onSaved: (String? val) {
            // Save the form data
            user.email = val!;
          },
        ),
        const SizedBox(height: 16.0),
        OutlinedButton(
          onPressed: () {
            submitInput();
          },
          child:const Text('Validate'),
        ),
      ],
    );
  }
}
