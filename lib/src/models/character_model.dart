import 'dart:convert';

class Character {
  final String name;
  final String house;
  final bool hogwartsStudent;
  final String actor;
  final String image;
  Character({
    required this.name,
    required this.house,
    required this.hogwartsStudent,
    required this.actor,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'house': house,
      'hogwartsStudent': hogwartsStudent,
      'actor': actor,
      'image': image,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      name: map['name'] as String,
      house: map['house'] as String,
      hogwartsStudent: map['hogwartsStudent'] as bool,
      actor: map['actor'] as String,
      image: map['image'] as String,
    );
  }

  @override
  String toString() {
    return 'Character(name: $name, house: $house, hogwartsStudent: $hogwartsStudent, actor: $actor, image: $image)';
  }

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.house == house &&
        other.hogwartsStudent == hogwartsStudent &&
        other.actor == actor &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        house.hashCode ^
        hogwartsStudent.hashCode ^
        actor.hashCode ^
        image.hashCode;
  }
}
