
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_cubit_app/models/text_model.dart';

void main() {
	group('TextModel', () {
		test('should correctly initialize with given text and icon', () {
			const text = 'Cat';
			const icon = Icons.pets;
			
			final model = TextModel(text: text, icon: icon);
			
			expect(model.text, text);
			expect(model.icon, icon);
		});
		
		test('should correctly serialize to JSON', () {
			const text = 'Cat';
			const icon = Icons.pets;
			final model = TextModel(text: text, icon: icon);
			
			final json = model.toJson();
			
			expect(json['text'], text);
			expect(json['icon'], icon.codePoint);
		});
		
		test('should correctly deserialize from JSON', () {
			const text = 'Cat';
			const iconCodePoint = Icons.pets.codePoint;
			final json = {'text': text, 'icon': iconCodePoint};
			
			final model = TextModel.fromJson(json);
			
			expect(model.text, text);
			expect(model.icon.codePoint, iconCodePoint);
		});
	});
}

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
