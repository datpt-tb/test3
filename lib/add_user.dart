import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_user_login/api_handler.dart';
import 'package:flutter_user_login/model.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormBuilderState>();
  ApiHandler apiHandler = ApiHandler();

  void addUser() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final user = User(
        id: 0,
        maNhanVien: data['maNhanVien'],
        matKhau: data['matKhau'],
      );

      await apiHandler.addUser(user: user);
    }

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.red,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: addUser,
        child: const Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'maNhanVien',
                decoration: const InputDecoration(labelText: 'maNhanVien'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                name: 'matKhau',
                decoration: const InputDecoration(labelText: 'MatKhau'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
