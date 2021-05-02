enum Direction {
  EAST,
  NORTH,
  WEST,
  SOUTH,
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);
}

abstract class Tetromino {
  static const _nextDirection = {
    Direction.EAST: Direction.NORTH,
    Direction.NORTH: Direction.WEST,
    Direction.WEST: Direction.SOUTH,
    Direction.SOUTH: Direction.EAST,
  };

  static final _types = {
    'I': (Point position) => TetrominoI(position),
    'L': (Point position) => TetrominoL(position),
  };

  /// Direction of the block
  Direction direction;

  Point position;

  final String type;

  Tetromino(this.type, this.direction, this.position);

  void rotate() {
    direction = _nextDirection[direction];
  }

  void move(int dx) {
    if (position.x + dx < 1) return;

    position.x = position.x + dx;
  }

  List<Point> getPoints();

  static Tetromino fromType(String type, Point point) => _types[type](point);
}

class TetrominoI extends Tetromino {
  TetrominoI(Point position) : super('I', Direction.EAST, position);

  @override
  List<Point> getPoints() {
    return direction == Direction.EAST || direction == Direction.WEST
        ? [
            Point(position.x - 1, position.y),
            Point(position.x, position.y),
            Point(position.x + 1, position.y),
            Point(position.x + 2, position.y),
          ]
        : [
            Point(position.x, position.y - 1),
            Point(position.x, position.y),
            Point(position.x, position.y + 1),
            Point(position.x, position.y + 2),
          ];
  }
}

class TetrominoL extends Tetromino {
  TetrominoL(Point position) : super('L', Direction.WEST, position);

  @override
  List<Point> getPoints() {
    switch (direction) {
      case Direction.WEST:
        return [
          Point(position.x - 2, position.y),
          Point(position.x - 1, position.y),
          Point(position.x, position.y),
          Point(position.x, position.y - 1),
        ];
        break;
      default:
        return [];
    }
  }
}
