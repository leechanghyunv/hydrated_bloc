import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hybrated_bloc_practice_230811/bloc_container/arrival_bloc/bloc_controller.dart';
import 'package:hybrated_bloc_practice_230811/screen/main_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'bloc_container/counter_bloc/bloc_controller.dart';
import 'bloc_container/repository_bloc/bloc_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory()
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<
            FilterContorller>(create: (_)=> FilterContorller()
        ),
        BlocProvider<
            CounterController>(create: (_)=> CounterController()
        ),
        BlocProvider<
            ArrivalController>(create: (_)=> ArrivalController()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

