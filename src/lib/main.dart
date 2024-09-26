
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/animal_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (context) => AnimalCubit(),
			child: MaterialApp(
				title: 'Animal Switcher',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: HomeScreen(),
			),
		);
	}
}
