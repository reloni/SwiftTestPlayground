import Foundation

struct Coordinate: Equatable {
    let x: Int
    let y: Int
    init(x: Int, y: Int) {
        let absX = abs(x)
        let absY = abs(y)
        
        if absY < absX {
            self.x = absY
            self.y = absX
        } else {
            self.x = absX
            self.y = absY
        }
    }
    
    func edgeCasesCount() -> Int? {
        let cases = [
            (Coordinate(x: 0, y: 0), 0),
            (Coordinate(x: 0, y: 1), 3),
            (Coordinate(x: 0, y: 2), 2),
            (Coordinate(x: 0, y: 3), 3),
            (Coordinate(x: 2, y: 2), 4),
            (Coordinate(x: 1, y: 1), 2),
            (Coordinate(x: 3, y: 3), 2)
        ]
        return cases.first(where: { $0.0 == self })?.1
    }
    
    func isOnVertical() -> Bool {
        return y >= 2 * x;
    }
    
    func isOnPrimaryDiagonal() -> Bool {
        return (x + y) % 2 == 0;
    }
    
    func isOnSecondaryDiagonal() -> Bool {
        return (x + y) % 2 == 1;
    }
    
    public static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

func knightOnABoard(_ x: Int, y: Int) -> Int {
    let coordinate = Coordinate(x: x, y: y)
    
    if let edge = coordinate.edgeCasesCount() {
        return edge
    } else if (coordinate.isOnVertical()) {
        return verticalMoveCount(coordinate);
    } else if (coordinate.isOnPrimaryDiagonal()) {
        return primaryDiagonalMoveCount(coordinate)
    } else if (coordinate.isOnSecondaryDiagonal()) {
        return secondaryDiagonalMoveCount(coordinate)
    }
    
    return -1
}

func fixedCoordinates(_ x: Int, y: Int) -> Coordinate {
    let absX = abs(x)
    let absY = abs(y)
    
    if absY < absX {
        return Coordinate(x: absY, y: absX)
    } else {
        return Coordinate(x: absX, y: absY)
    }
}

func verticalMoveCount(_ coordinate: Coordinate) -> Int {
    let normalizedHeight = getNormalizedHeightForVerticalGroupCase(coordinate);
    let groupIndex = normalizedHeight / 4
    let groupStartMoveCount = groupIndex * 2 + coordinate.x;
    return groupStartMoveCount + getIndexInVerticalGroup(coordinate);
}

func primaryDiagonalMoveCount(_ coordinate: Coordinate) -> Int {
    let diagonalOffset = coordinate.y + coordinate.x;
    let diagonalIntersect = diagonalOffset / 2;
    return (diagonalIntersect + 2) / 3 * 2;
}

func secondaryDiagonalMoveCount(_ coordinate: Coordinate) -> Int {
    let diagonalOffset = coordinate.y + coordinate.x;
    let diagonalIntersect = diagonalOffset / 2 - 1;
    return (diagonalIntersect + 2) / 3 * 2 + 1;
}

func getNormalizedHeightForVerticalGroupCase(_ coordinate: Coordinate) -> Int {
    return coordinate.y - coordinate.x * 2
}

func getIndexInVerticalGroup(_ coordinate: Coordinate) -> Int {
    return getNormalizedHeightForVerticalGroupCase(coordinate) % 4;
}
