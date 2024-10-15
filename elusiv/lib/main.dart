import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  // // Determine the environment and load the corresponding .env file
  // const String env = String.fromEnvironment('FLAVOR', defaultValue: 'local');
  // String envFile;
  // switch (env) {
  //   case 'staging':
  //     envFile = '.env.staging';
  //     break;
  //   case 'prod':
  //     envFile = '.env.prod';
  //     break;
  //   case 'local':
  //   default:
  //     envFile = '.env.local';
  //     break;
  // }
  // // Load the environment variables
  // await dotenv.load(fileName: envFile);
  // // Initialize Supabase
  // await Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!,
  //   anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  //   // Optionally, include other Supabase options
  // );

  runApp(const Elusiv());
}

class Elusiv extends StatelessWidget {
  const Elusiv({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: elusivTheme,
    );
  }
}