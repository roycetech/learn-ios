// Create instance
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


// Inheritance, overriding methods.
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


// Accessor Methods
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


// Running a code before and after setting a new value
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


// Optionally unwrap
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


// Enum
let ace = Rank.ace
let aceRawValue = ace.rawValue


// make an instance of an enumeration from a raw value.
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}


// Enum case values are the actual values, not another way of writing their raw values.
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
hearts.color()
// hearts == 1  Error


// struct
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// Experiment
Card.createFullDeck()


// Enum With associated values.
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .third(message):
    print("third: \(message)")
}


// class conforming to a protocol
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


// Structure conforming to a protocol
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


// Enum Conforming to a protocol
enum OddEven: ExampleProtocol {
    case odd, even
    
    var simpleDescription: String {
        return self.getDescription()
    }
    
    func getDescription() -> String {
        switch self {
        case .odd:
            return "A simple description of enum"
        case .even:
            return "Adjusted description of enum"
        }
    }

    mutating public func adjust() {}
}


// Adding functionality to existing type using extensions
extension Int: ExampleProtocol {
    public var simpleDescription: String {
        return "The number \(self)"
    }
    mutating public func adjust() {
        self += 42
    }
}
print(7.simpleDescription)


// Experiment
protocol AbsoluteProtocol {
    var absValue: Int { get }
}
extension Double: AbsoluteProtocol {
    internal var absValue: Int {
        return abs(Int(self))
    }
}


// When using protocol type, members outside of protocol type is unavailable.
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error


// Throwing and error and throws declaration
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


// Error handling
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)  // explicit error variable.
}


// Experiment
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)  // explicit error variable.
}


// Multiple catch block
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


// try? to return an optional
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


// defer to setup and cleanup code
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


// Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes:4)


// Using generics on enum
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


// Use where right before the body to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])


// Experiment
func anyCommonElements2<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
        
        var result: [T.Iterator.Element] = []
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    result.append(lhsItem)
                }
            }
        }
        return false
}
anyCommonElements2([1, 2, 3], [3])



