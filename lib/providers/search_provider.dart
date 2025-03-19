import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchResultsProvider = StateProvider<List<String>>((ref) => []);

final searchQueryProvider = StateProvider<String>((ref) => '');
