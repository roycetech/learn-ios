import Foundation

public class SimpleClass: ExampleProtocol {
    public var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    public func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
