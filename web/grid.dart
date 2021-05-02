import 'block.dart';

class Grid {
  static const width = 10;
  static const height = 20;
  final cells = List<List<String>>.generate(
      height, (_) => List<String>.filled(width, null));

  Tetromino activeBlock;

  Grid() {
    activeBlock = TetrominoI(Point(5, 5));
    drawActiveBlock();
  }

  void drawActiveBlock({bool erase = false}) {
    for (var point in activeBlock.getPoints()) {
      cells[point.y][point.x] = erase ? null : activeBlock.type;
    }
  }

  void rotateActiveBlock() {
    drawActiveBlock(erase: true);
    activeBlock.rotate();
    drawActiveBlock();
  }

  void moveActiveBlock(int dx) {
    drawActiveBlock(erase: true);
    activeBlock.move(dx);
    drawActiveBlock();
  }

  void generate(String type) {
    drawActiveBlock(erase: true);
    activeBlock = Tetromino.fromType(type, Point(5, 5));
    drawActiveBlock();
  }
}
