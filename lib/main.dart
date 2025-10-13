import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopease/project/auth/resetpass.dart';
import 'package:shopease/project/homescreen.dart';
import 'package:shopease/project/auth/login_page.dart';
import 'package:shopease/providers/orders_provider.dart';
import 'package:shopease/providers/supabase.dart';
import 'package:shopease/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:shopease/providers/Wishlist_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://ixpmygudjphdvpstwghc.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml4cG15Z3VkanBoZHZwc3R3Z2hjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk3MzQyNjQsImV4cCI6MjA3NTMxMDI2NH0.PlhZq8oIFaZaTEe3naPNLs_BAoMs4AmaT1iPkaFfwr8';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
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
    GoRoute(
      path: '/reset',
      builder: (BuildContext context, GoRouterState state) {
        return const Resetpassword();
      },
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  void _initDeepLinks() {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri == null) return;
      debugPrint('🔗 Deep link received: $uri');

      if (uri.host == 'reset-password') {
        _router.go('/reset');
      }
    });
  }

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
