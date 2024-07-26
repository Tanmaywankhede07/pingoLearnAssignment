import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:pingolearn/res/AppColors.dart';
import 'package:pingolearn/ui/login/login_screen.dart';
import 'package:pingolearn/providers/product_provider.dart'; // Import your provider here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(context)),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
