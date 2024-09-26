
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/models/animal.dart';

void main() {
	group('Animal Model', () {
		test('Animal model should have a name and an icon', () {
			final animal = Animal(name: 'Cat', icon: Icons.pets);

			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});

		test('Animal model should be serializable to JSON', () {
			final animal = Animal(name: 'Dog', icon: Icons.person);
			final json = animal.toJson();
			
			expect(json['name'], 'Dog');
			expect(json['icon'], 'person'); // Assuming icon is serialized as a string
		});

		test('Animal model should be deserializable from JSON', () {
			final json = {
				'name': 'Cat',
				'icon': 'pets' // Assuming icon is serialized as a string
			};
			final animal = Animal.fromJson(json);
			
			expect(animal.name, 'Cat');
			expect(animal.icon, Icons.pets);
		});
	});
}
