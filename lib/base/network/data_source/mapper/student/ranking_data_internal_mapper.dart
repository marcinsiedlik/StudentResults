import 'package:injectable/injectable.dart';
import 'package:results/base/network/data_source/mapper/student/students_ui_mapper.dart';
import 'package:results/base/network/data_source/model/student/network/network_student.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_ranking_data.dart';
import 'package:results/base/network/mapper/internal_mapper.dart';

@lazySingleton
class RankingDataInternalMapper implements InternalMapper<List<NetworkStudent>, UiRankingData> {
  final StudentsUiMapper _studentsUiMapper;

  RankingDataInternalMapper(this._studentsUiMapper);

  @override
  UiRankingData map(List<NetworkStudent> model) {
    final students = _studentsUiMapper.mapToUi(model);
    return UiRankingData(
      first: students[0],
      second: students[1],
      third: students[2],
      other: students.getRange(3, students.length).toList(),
    );
  }
}
