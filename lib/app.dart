import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'data/repository.dart';
import 'env/environment.dart';
import 'firebase_options.dart';
import 'intl/i18n.dart';
import 'ui.dart';
import 'utils/error_utils.dart';
import 'view_model/app_view_model.dart';
import 'views/navigation/app_routes.dart';
import 'views/widgets/app_theme.dart';

Future<void> app(Environment env) async {

  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final AppRepository repo = AppRepository(env);
      await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
      runApp(
        AppProvider(
          repo: repo,
          child: const Application(),
        ),
      );
    },
    (Object error, StackTrace stack) async {
      AppErrorUtils.handleError(error, stack);
    },
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late RouterConfig<Object> router;

  @override
  void initState() {
    super.initState();
    router = appRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Application',
      darkTheme: getTheme(isDarkMode: true),
      theme: getTheme(),
      routerConfig: router,
      locale: AppStringsDelegate.english,
      supportedLocales: AppStringsDelegate.appSupportedLocales,
      localizationsDelegates: AppStringsDelegate.delegates,
    );
  }
}
