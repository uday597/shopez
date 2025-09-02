import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopease/project/homescreen.dart';
import 'package:shopease/project/login_page.dart';
import 'package:shopease/providers/supabase.dart';
import 'package:shopease/providers/wishlist_provider.dart';
import 'package:shopease/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://eyctbxaonlsrptdedpnr.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV5Y3RieGFvbmxzcnB0ZGVkcG5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU2NzAzMDAsImV4cCI6MjA3MTI0NjMwMH0.M9YU3KsHu_vAFTTqS7QZe6loNQ8k-d-uiv_kDFQjTo8';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SupaProvider()..fatchdata()),
        ChangeNotifierProvider(create: (_) => CartProviders()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return Productlist();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
