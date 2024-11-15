import 'package:flutter/material.dart';
import 'package:flutter_user_login/api_handler.dart';
import 'package:flutter_user_login/model.dart';

class FindUser extends StatefulWidget {
  const FindUser({super.key});

  @override
  State<FindUser> createState() => _FindUserState();
}

class _FindUserState extends State<FindUser> {
  ApiHandler apiHandler = ApiHandler();
  User user = const User.empty();
  TextEditingController textEditingController = TextEditingController();

  void findUser(int userId) async {
    user = await apiHandler.getUserById(userId: userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find User"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: (){
          findUser(int.parse(textEditingController.text));
        },
        child: const Text('Find'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Text("${user.id}"),
              title: Text(user.maNhanVien),
              subtitle: Text(user.matKhau),
            ),
          ],
        ),
      ),
    );
  }
}