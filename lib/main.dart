import 'package:app_visao_artificial/injection_container.dart' as di;
import 'package:app_visao_artificial/presentation/cubit/detection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  
  di.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: BlocProvider(
        create: (_) => di.sl<DetectionCubit>(),
        child: const MyHomePage(title: 'Visão Artificial'),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<DetectionCubit>().initMonitoramento();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Monitoramento em segundo plano iniciado'),
              ),
            );
          },
          child: const Text('Ativar processamento em background de fala.'),
        ),
      ),
    );
  }
}
