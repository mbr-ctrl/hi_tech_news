
import 'package:intl/intl.dart';

  final today = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');
  final endDate = formatter.format(today);

// Récupère la date d'il y a trois jours
  final threeDaysAgo = today.subtract(const Duration(days: 3));
  final beginDate = formatter.format(threeDaysAgo);

