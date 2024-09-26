
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/screens/home_screen.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('Displays initial animal as "Cat" with clock icon', (WidgetTester tester) async {
			final mockCubit = MockAnimalCubit();
			when(() => mockCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (context) => mockCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
			expect(find.byIcon(Icons.person), findsNothing);
			expect(find.text('Dog'), findsNothing);
		});

		testWidgets('Toggles animal to "Dog" with person icon when clicked', (WidgetTester tester) async {
			final mockCubit = MockAnimalCubit();
			when(() => mockCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)));
			whenListen(
				mockCubit,
				Stream.fromIterable([
					AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time)),
					AnimalState(animal: Animal(name: 'Dog', icon: Icons.person))
				]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (context) => mockCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsNothing);
			expect(find.text('Cat'), findsNothing);
		});
	});
}
