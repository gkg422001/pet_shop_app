class Friend {
  final String name;

  Friend({required this.name});

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        name: json['name'],
      );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class Belonging {
  final String name;

  Belonging({required this.name});

  factory Belonging.fromJson(Map<String, dynamic> json) => Belonging(
        name: json['name'],
      );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class Borrowed {
  final int
      whatId; // Assuming 'what' is a ForeignKey to another model, represented by its ID
  final int
      toWhoId; // Assuming 'to_who' is a ForeignKey to another model, represented by its ID
  final DateTime when;
  final DateTime? returned; // Nullable DateTime field

  Borrowed({
    required this.whatId,
    required this.toWhoId,
    required this.when,
    this.returned,
  });

  // Factory constructor to create a Borrowed instance from a Map (e.g., from JSON)
  factory Borrowed.fromJson(Map<String, dynamic> json) {
    return Borrowed(
      whatId: json['what'],
      toWhoId: json['to_who'],
      when: DateTime.parse(json['when']),
      returned:
          json['returned'] != null ? DateTime.parse(json['returned']) : null,
    );
  }

  // Method to convert a Borrowed instance to a Map (e.g., for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'what': whatId,
      'to_who': toWhoId,
      'when': when.toIso8601String(),
      'returned': returned?.toIso8601String(),
    };
  }
}
