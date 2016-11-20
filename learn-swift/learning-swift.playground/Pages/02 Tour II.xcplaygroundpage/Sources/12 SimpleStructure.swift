import Foundation

public struct SimpleStructure: ExampleProtocol {
    
    public init() {}
    
    public var simpleDescription: String = "A simple structure"
    
    mutating public func adjust() {
        simpleDescription += " (adjusted)"
    }
}
