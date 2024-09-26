
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});

	// Method to convert Animal object to JSON
	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': icon.codePoint.toString(), // Serialize icon as a string
		};
	}

	// Factory method to create an Animal object from JSON
	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			name: json['name'],
			icon: IconData(
				int.parse(json['icon']),
				fontFamily: 'MaterialIcons',
			),
		);
	}
}
