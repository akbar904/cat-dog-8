
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/text_cubit.dart';
import 'package:com.example.simple_cubit_app/widgets/text_icon_widget.dart';
import 'package:com.example.simple_cubit_app/models/text_model.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: BlocBuilder<TextCubit, TextModel>(
					builder: (context, state) {
						return GestureDetector(
							onTap: () => context.read<TextCubit>().toggleText(),
							child: TextIconWidget(
								text: state.text,
								icon: state.icon,
							),
						);
					},
				),
			),
		);
	}
}
