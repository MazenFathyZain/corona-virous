import 'package:coronavirus/app/repositories/data_repository.dart';
import 'package:coronavirus/app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/services/api.dart';
import 'app/ui/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(apiService: APIService(API.sandBox())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF101010),
          cardColor: const Color(0xFF222222),
        ),
        home: const Dashboard(),
      ),
    );
  }
}

