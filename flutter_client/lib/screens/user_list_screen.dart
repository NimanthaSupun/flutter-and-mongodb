import 'package:flutter/material.dart';
import 'package:flutter_client/providers/user_provider.dart';
import 'package:flutter_client/screens/add_user.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User list Screen",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddUserScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (
          context,
          userProvider,
          child,
        ) {
          if (userProvider.users.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final  user = userProvider.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
