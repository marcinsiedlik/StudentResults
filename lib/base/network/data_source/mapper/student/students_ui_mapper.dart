import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/list_extensions.dart';
import 'package:results/base/network/data_source/model/student/network/network_student.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/mapper/ui_mapper.dart';

@lazySingleton
class StudentsUiMapper implements UiMapper<List<NetworkStudent>, List<UiStudent>> {
  @override
  List<UiStudent> mapToUi(List<NetworkStudent> network) => network
      .mapIndexed(
        (index, item) => UiStudent(
          place: index,
          index: item.index,
          mark: item.mark,
          group: item.group,
          lecturePoints: item.lecturePoints,
          homeworkPoints: item.homeworkPoints,
          presenceCounter: item.presenceCounter,
          absenceCounter: item.absenceCounter,
          allPoints: item.allPoints,
        ),
      )
      .toList();
}
