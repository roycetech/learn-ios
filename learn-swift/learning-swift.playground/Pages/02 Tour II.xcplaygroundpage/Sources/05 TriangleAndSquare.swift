import Foundation

public class TriangleAndSquare {
    public var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    public var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    public init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
