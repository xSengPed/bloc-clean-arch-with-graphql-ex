import 'package:bloc_graphql_implements_101/api/api_services.dart';
import 'package:get_it/get_it.dart';

void initializeDependency() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiServices>(ApiServices.init());
}
