/** Everything is public in order to be accessed in the playground which is treated like a separate module by the compiler.  */

public class EquilateralTriangle: NamedShape {
    
    public var sideLength: Double = 0.0
    
    public init(sideLength: Double, name: String) {
        super.init(name: name)
        self.sideLength = sideLength
        numberOfSides = 3
    }
    
    public var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0  // newValue is an implicit name.  You can put an identifier inside a parenthesis to make it explicit.
        }
    }
    
    public override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
