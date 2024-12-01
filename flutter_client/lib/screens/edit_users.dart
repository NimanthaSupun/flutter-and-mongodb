import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/providers/user_provider.dart';
import 'package:provider/provider.dart';

class EditUsersSreen extends StatefulWidget {
  final User user;
  const EditUsersSreen({
    super.key,
    required this.user,
  });

  @override
  State<EditUsersSreen> createState() => _EditUsersSreenState();
}

class _EditUsersSreenState extends State<EditUsersSreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _ageController = TextEditingController(text: widget.user.age.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new user"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: _ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final User updateUser = User(
                          id: widget.user.id,
                          name: _nameController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text),
                        );

                        Provider.of<UserProvider>(context, listen: false)
                            .updateUser(
                          updateUser,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Update User"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
