import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/theme/app_colors.dart';
import 'package:henna_by_basith/features/bookings/view_model/dashboard_view_model.dart';
import 'package:henna_by_basith/features/dashboard/view/dashboard_screen.dart';
import 'package:henna_by_basith/features/dashboard/view/product_screen.dart' hide AppColors;
import 'package:henna_by_basith/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ArtisanCommandCenterApp());
}

class ArtisanCommandCenterApp extends StatelessWidget {
  const ArtisanCommandCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) =>DashboardViewModel() ,),
      ChangeNotifierProvider(create: (context) => ProductFormProvider(),)],
      child: MaterialApp(
         initialRoute: '/dashboard',
         routes: {
            '/dashboard': (context) => const DashboardScreen(),
            '/products': (context) => const AddProductScreen(),
         },
        title: 'Artisan Command Center',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryBrick,
            surface: AppColors.background,
          ),
        ),
       
      ),
    );
  }
}