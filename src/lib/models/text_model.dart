
import 'package:flutter/material.dart';

class TextModel {
	final String text;
	final IconData icon;

	TextModel({required this.text, required this.icon});

	Map<String, dynamic> toJson() {
		return {
			'text': text,
			'icon': icon.codePoint,
		};
	}

	static TextModel fromJson(Map<String, dynamic> json) {
		return TextModel(
			text: json['text'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
