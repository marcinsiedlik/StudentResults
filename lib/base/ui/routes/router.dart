import 'package:auto_route/auto_route_annotations.dart';
import 'package:results/feature/ranking/ranking_page.dart';
import 'package:results/feature/student_details/student_details_page.dart';

@AdaptiveAutoRouter(
  generateNavigationHelperExtension: true,
  generateArgsHolderForSingleParameterRoutes: false,
)
abstract class $Router {
  @initial
  RankingPage rankingPage;
  StudentDetailsPage studentDetailsPage;
}
