import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ViewModels/catalogviewmodel.dart';

final catalogProvider = ChangeNotifierProvider<FireFlutterTextFieldModel>(
    (_) => CatalogViewModel());
