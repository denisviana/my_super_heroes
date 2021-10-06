import 'package:meta/meta.dart';

@immutable
class WorkEntity {
  final String occupation;
  final String base;

  const WorkEntity({
    required this.occupation,
    required this.base,
  });
}
