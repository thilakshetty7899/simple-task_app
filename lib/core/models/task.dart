// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  final String id;
  final String name;
  final String description;
  final bool done;
  final DateTime createdAt;
  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.done,
    required this.createdAt,
  });
  bool get ready => name.isNotEmpty && description.isNotEmpty;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'done': done,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      done: map['done'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  Task copyWith({
    String? id,
    String? name,
    String? description,
    bool? done,
    DateTime? createdAt,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      done: done ?? this.done,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
