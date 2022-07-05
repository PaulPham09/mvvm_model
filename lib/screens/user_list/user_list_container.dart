import 'package:flutter/material.dart';
import 'package:mvvm_model/screens/user_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

class UserListContainer extends StatefulWidget {
  const UserListContainer({Key? key}) : super(key: key);

  @override
  State<UserListContainer> createState() => _UserListContainerState();
}

class _UserListContainerState extends State<UserListContainer> {
  Widget _buildUserListContainer(UsersViewModel userViewModel) {
    return ListView.builder(
        shrinkWrap: false,
        itemCount: userViewModel.userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${userViewModel.userList[index].username}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0)),
                SizedBox(height: 4.0),
                Text('Email: ${userViewModel.userList[index].email}'),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UsersViewModel>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('User List'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text('Danh sách nhân viên',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Expanded(child: _buildUserListContainer(userViewModel)),
          ],
        ));
  }
}
