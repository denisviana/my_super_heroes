
import 'package:meta/meta.dart';

@immutable
class ConnectionsEntity {
  final String groupAffiliation;
  final String relatives;

  const ConnectionsEntity({
    required this.groupAffiliation,
    required this.relatives,
  });
}
