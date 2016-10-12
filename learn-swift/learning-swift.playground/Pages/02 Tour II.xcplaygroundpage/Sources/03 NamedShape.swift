import Foundation


// Class Declaration with initializaer
public class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    public init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
