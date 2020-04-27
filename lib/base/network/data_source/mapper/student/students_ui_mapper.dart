import 'package:injectable/injectable.dart';
import 'package:results/base/extensions/list_extensions.dart';
import 'package:results/base/network/data_source/model/student/network/network_student.dart';
import 'package:results/base/network/data_source/model/student/ui/place_type.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/network/mapper/ui_mapper.dart';

@lazySingleton
class StudentsUiMapper implements UiMapper<List<NetworkStudent>, List<UiStudent>> {
  @override
  List<UiStudent> mapToUi(List<NetworkStudent> network) => network
      .mapIndexed(
        (index, item) => UiStudent(
          place: index + 1,
          placeType: _getPlaceType(index + 1),
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

  PlaceType _getPlaceType(int place) {
    if (place == 1) {
      return PlaceType.first();
    } else if (place == 2) {
      return PlaceType.second();
    } else if (place == 2) {
      return PlaceType.third();
    }
    return PlaceType.other(place);
  }
}
