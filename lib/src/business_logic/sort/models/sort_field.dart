enum SortField{
  DATE,
  PRICE,
  ROOMS,
  AREA,
  ID
}

extension SortField_ on SortField {
  static SortField fromString(String name) {
    if (name is String) name = name.toLowerCase();

    switch (name) {
      case 'createdDate':
        return SortField.DATE;
      case 'objectPrice':
        return SortField.PRICE;
      case 'totalArea':
        return SortField.AREA;
      case 'numberOfRooms':
        return SortField.ROOMS;
      case 'id':
        return SortField.ID;
      default:
        return SortField.ID;
    }
  }

  String get name {
    switch (this) {
      case SortField.DATE:
        return 'createdDate';
      case SortField.PRICE:
        return 'objectPrice';
      case SortField.AREA:
        return 'totalArea';
      case SortField.ROOMS:
        return 'numberOfRooms';
      case SortField.ID:
        return 'id';
      default:
        return 'id';
    }
  }
}
