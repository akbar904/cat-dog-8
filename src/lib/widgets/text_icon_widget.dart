
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/text_cubit.dart';
import '../models/text_model.dart';

class TextIconWidget extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<TextCubit, TextModel>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<TextCubit>().toggleText(),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.text),
							SizedBox(width: 8),
							Icon(state.icon),
						],
					),
				);
			},
		);
	}
}
