import 'package:elusiv/core/navigation/routing.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Determine the environment and load the corresponding .env file
  const String env = String.fromEnvironment('FLAVOR', defaultValue: 'local');
  String apiURl;
  switch (env) {
    case 'staging':
      apiURl = 'https://stagingelusiv.infiniplay.games/';
      break;
    case 'prod':
      apiURl = 'https://elusiv.infiniplay.games/';
      break;
    case 'local':
    default:
      apiURl = 'http://127.0.0.1:8090';
      break;
  }

  // create authstore to store credentials and retrieve stored credentials

  //create SharedPreferences instance
  final prefs = await SharedPreferences.getInstance();

  //create AsyncAuthStore instance
  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );

  // Initialize PocketBase with the API URL
  final pb = PocketBase(apiURl, authStore: store);

  // get pb instance in any widget using provider
  //import 'package:pocketbase/pocketbase.dart';
  //import 'package:provider/provider.dart';
  //final pb = Provider.of<PocketBase>(context);

  // Check if the stored credentials are valid
  //pb.authStore.isValid();

  runApp(
    Provider<PocketBase>.value(
      value: pb,
      child: const Elusiv(),
    ),
  );
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
