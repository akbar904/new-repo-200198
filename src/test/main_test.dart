
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/main.dart';

// Mock AnimalCubit for testing
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('main.dart', () {
		testWidgets('MyApp initializes without errors', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(MyApp), findsOneWidget);
		});
	});
}
