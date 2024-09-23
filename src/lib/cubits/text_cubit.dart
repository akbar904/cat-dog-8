
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/text_model.dart';

// Define the TextCubit
class TextCubit extends Cubit<TextModel> {
	TextCubit() : super(TextModel(text: 'Cat', icon: Icons.pets));

	void toggleText() {
		if (state.text == 'Cat') {
			emit(TextModel(text: 'Dog', icon: Icons.person));
		} else {
			emit(TextModel(text: 'Cat', icon: Icons.pets));
		}
	}
}

// Define the TextModel
class TextModel extends Equatable {
	final String text;
	final IconData icon;

	TextModel({required this.text, required this.icon});

	@override
	List<Object?> get props => [text, icon];
}
