import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/models/product.dart';

final targetProductProvider = StateProvider<List>((ref) => []);
