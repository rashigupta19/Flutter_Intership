import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/university.dart';
import 'package:thirdtask_api/utils/api_client.dart';

final universityStateFuture = FutureProvider<List<University>>((ref) async {
  return fetchUniversity();
});
