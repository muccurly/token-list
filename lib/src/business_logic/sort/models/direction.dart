enum Direction {
  ASC,
  DESC,
}

extension Direction_ on Direction {
  static Direction fromString(String name) {
    if (name is String) name = name.toLowerCase();

    switch (name) {
      case 'asc':
        return Direction.ASC;
      case 'desc':
        return Direction.DESC;
      default:
        return Direction.DESC;
    }
  }

  String get name {
    switch (this) {
      case Direction.ASC:
        return 'ASC';
      case Direction.DESC:
        return 'DESC';
      default:
        return 'DESC';
    }
  }
}
