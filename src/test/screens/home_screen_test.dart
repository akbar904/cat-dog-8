
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:com.example.simple_cubit_app/screens/home_screen.dart';
import 'package:com.example.simple_cubit_app/cubits/text_cubit.dart';
import 'package:com.example.simple_cubit_app/models/text_model.dart';
import 'package:com.example.simple_cubit_app/widgets/text_icon_widget.dart';

class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = MockTextCubit();
		});

		testWidgets('Displays initial text and icon', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Toggles text and icon on tap', (WidgetTester tester) async {
			when(() => textCubit.state).thenReturn(TextModel(text: 'Cat', icon: Icons.access_time));
			whenListen(
				textCubit,
				Stream.fromIterable([
					TextModel(text: 'Dog', icon: Icons.person),
				]),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: textCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);

			await tester.tap(find.byType(TextIconWidget));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
