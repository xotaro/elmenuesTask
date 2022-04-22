import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'configuartion.config.dart';


final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async => await $initGetIt(getIt);
