import 'block.dart';

class Grid {
  final cells = List<List<String>>.generate(Tetromino.gridHeight,
      (_) => List<String>.filled(Tetromino.gridWidth, null));

  Tetromino activeBlock;

  Grid() {
    activeBlock = TetrominoI();
    drawActiveBlock();
  }

  void drawActiveBlock({bool erase = false}) {
    for (var point in activeBlock.blocks) {
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
    activeBlock = Tetromino.fromType(type);
    drawActiveBlock();
  }
}
