import 'package:equatable/equatable.dart';

class PolicyEntity extends Equatable {
  const PolicyEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [id, title, content, createdAt, updatedAt];
}
