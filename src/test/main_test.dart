
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('Main', () {
		// Test the main entry point of the application
		testWidgets('MyApp initializes correctly', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify MyApp sets up the initial screen correctly
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		blocTest<TextCubit, TextModel>(
			'emits Dog with person icon when toggleText is called initially',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextModel(text: 'Dog', icon: Icons.person)],
		);

		blocTest<TextCubit, TextModel>(
			'emits Cat with clock icon when toggleText is called after Dog',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [TextModel(text: 'Dog', icon: Icons.person), TextModel(text: 'Cat', icon: Icons.access_time)],
		);
	});

	group('HomeScreen', () {
		// Test the HomeScreen widget
		testWidgets('displays initial text and icon correctly', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify the initial text and icon are displayed
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles text and icon on tap', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Tap the text to toggle
			await tester.tap(find.text('Cat'));
			await tester.pump();

			// Verify the toggled text and icon are displayed
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
