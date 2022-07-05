import 'package:flutter/material.dart';
import 'package:mvvm_model/screens/user_list/user_list_container.dart';
import 'package:mvvm_model/screens/user_list/view_model/users_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MVVMModelApp());
}

class MVVMModelApp extends StatelessWidget {
  const MVVMModelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsersViewModel())],
      child: MaterialApp(
        title: 'MVVM Model App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        darkTheme: ThemeData(primarySwatch: Colors.blueGrey),
        home: UserListContainer(),
      ),
    );
  }
}
