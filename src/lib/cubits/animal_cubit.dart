
import 'package:flutter_bloc/flutter_bloc.dart';

enum AnimalState { cat, dog }

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState.cat);

	void toggleAnimal() {
		if (state == AnimalState.cat) {
			emit(AnimalState.dog);
		} else {
			emit(AnimalState.cat);
		}
	}
}
