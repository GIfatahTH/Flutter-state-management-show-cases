import './bloc_setting.dart';
export './bloc_setting.dart';

class MainBloc extends BloCSetting {
  int counter = 0;

  incrementCounter() {
    counter++;
    rebuildWidgets(ids: ["CounterText"]);
  }
}

MainBloc mainBloc;
