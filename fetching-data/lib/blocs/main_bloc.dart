import './bloc_setting.dart';
export './bloc_setting.dart';
import 'dart:math';
import 'dart:async';

class MainBloc extends BloCSetting {
  List<int> items = [];
  bool listIsLoading = true;

  Future<void> fetchList() async {
    items = await Future.delayed(
      Duration(seconds: 2),
      () => List<int>.generate(10, (_) => Random().nextInt(9) + 1),
    );

    listIsLoading = false;
    rebuildWidgets(ids: ["ListView"]);
  }

  void decrement(int index, state) {
    items[index]--;

    if (items[index] > 0) {
      rebuildWidgets(states: [state]);
    } else {
      items.removeAt(index);
      rebuildWidgets(ids: ["ListView"]);
    }
  }
}

MainBloc mainBloc;

// // THIRD CASE
// class MainBloc extends BloCSetting {
//   List<int> items = [];
//   bool listIsLoading = true;

//   Future<void> fetchList() async {
//     items = await Future.delayed(
//       Duration(seconds: 2),
//       () => List<int>.generate(10, (_) => Random().nextInt(9) + 1),
//     );

//     listIsLoading = false;
//     rebuildWidgets(ids: ["ListView"]);
//   }

//   void decrement(int index, state) {
//     items[index]--;
//     rebuildWidgets(states: [state]);
//   }
// }

// SECOND Case
// class MainBloc extends BloCSetting {
//   List<int> items = [];
//   bool listIsLoading = true;

//   Future<void> fetchList() async {
//     items = await Future.delayed(
//       Duration(seconds: 2),
//       () => List<int>.generate(10, (_) => Random().nextInt(9) + 1),
//     );

//     listIsLoading = false;
//     rebuildWidgets(ids: ["ListView"]);
//   }

//   void decrement(int index) {
//     items[index]--;
//   }
// }

// // FIRST CASE
// class MainBloc extends BloCSetting {
//   List<int> items = [];
//   bool listIsLoading = true;

//   Future<void> fetchList(state) async {
//     items = await Future.delayed(
//       Duration(seconds: 2),
//       () => List<int>.generate(10, (_) => Random().nextInt(9) + 1),
//     );

//     listIsLoading = false;
//     rebuildWidgets(states: [state]);
//   }

//   void decrement(int index) {
//     items[index]--;
//   }
// }

// BEFORE;
// class MainBloc extends BloCSetting {
//   List<int> items = [];
//   bool listIsLoading = true;

//   Future<void> fetchList() async {
//     items = await Future.delayed(
//       Duration(seconds: 1),
//       () => List<int>.generate(10, (_) => Random().nextInt(9) + 1),
//     );

//     listIsLoading = false;
//   }

//   void deccrement(int index) {
//     items[index]--;
//   }
// }
