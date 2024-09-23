
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/cubits/text_cubit.dart';

// Mocking the TextCubit
class MockTextCubit extends MockCubit<TextModel> implements TextCubit {}

void main() {
	group('TextCubit', () {
		late TextCubit textCubit;

		setUp(() {
			textCubit = TextCubit();
		});
	
		tearDown(() {
			textCubit.close();
		});

		test('initial state is TextModel(text: "Cat", icon: Icons.pets)', () {
			expect(textCubit.state, TextModel(text: 'Cat', icon: Icons.pets));
		});

		blocTest<TextCubit, TextModel>(
			'emits [TextModel(text: "Dog", icon: Icons.person)] when toggleText is called',
			build: () => textCubit,
			act: (cubit) => cubit.toggleText(),
			expect: () => [TextModel(text: 'Dog', icon: Icons.person)],
		);

		blocTest<TextCubit, TextModel>(
			'emits [TextModel(text: "Cat", icon: Icons.pets)] when toggleText is called after state is Dog',
			build: () => textCubit,
			act: (cubit) {
				cubit.toggleText();
				cubit.toggleText();
			},
			expect: () => [
				TextModel(text: 'Dog', icon: Icons.person),
				TextModel(text: 'Cat', icon: Icons.pets)
			],
		);
	});
}
