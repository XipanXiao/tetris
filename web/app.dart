import 'dart:html';

import 'package:angular/angular.dart';

import 'grid.dart';

@Component(
  selector: 'app',
  directives: [coreDirectives],
  templateUrl: 'app.html',
  styleUrls: ['app.css'],
)
class AppComponent {
  static const types = ['I', 'L', 'J', 'O', 'T', 'S', 'Z'];
  final grid = Grid();

  void onKeyUp(KeyboardEvent event) {
    switch (event.keyCode) {
      case KeyCode.UP:
        grid.rotateActiveBlock();
        break;
      case KeyCode.LEFT:
        grid.moveActiveBlock(-1);
        break;
      case KeyCode.RIGHT:
        grid.moveActiveBlock(1);
        break;
    }
  }

  void generate(String type) => grid.generate(type);
}
