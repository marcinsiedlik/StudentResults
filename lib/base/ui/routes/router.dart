import 'package:auto_route/auto_route_annotations.dart';
import 'package:results/feature/ranking/ranking_page.dart';

@CupertinoAutoRouter(
  generateNavigationHelperExtension: true,
  generateArgsHolderForSingleParameterRoutes: false,
)
abstract class $Router {
  @initial
  RankingPage rankingPage;
}
