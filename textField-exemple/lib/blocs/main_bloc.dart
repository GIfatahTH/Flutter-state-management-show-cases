import './bloc_setting.dart';
export './bloc_setting.dart';

class MainBloc extends BloCSetting {
  String text = "";
  String errorMsg;

  onChanged(String s) {
    text = s;
    errorMsg = s + ' is not allowed';

    rebuildWidgets(ids: ["Column"]);
  }
}

MainBloc mainBloc;

// class MainBloc extends BloCSetting {
//   String text = "";
//   String errorMsg;

//   onChanged(String s) {
//     text = s;
//     errorMsg = s + ' is not allowed';

//     rebuildWidgets(ids: ["Text" , "TextField"]);
//   }
// }
