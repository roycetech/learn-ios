//: Playground - noun: a place where people can play

print("Hello World")


// Variable and constant initialization
var myVariable = 42
myVariable = 50
let myConstant = 42


// Implicit Typing
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let four: Float = 4


// Explicit Conversion
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


// String interpolation
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


// Array.  Comma is allowed after the last element.
var shoppingList = ["catfish", "water", "tulips", "blue paint",]
shoppingList[1] = "bottle of water"


// Dictionary.  Comma is allowed after the last element.
var occupations = [ "Malcolm": "Captain",
                    "Kaylee": "Mechanic",]
occupations["Jayne"] = "Public Relations"


// Empty collection
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
shoppingList = []
occupations = [:]


// Control flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


// Optionals
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}



// Default value using the ?? operator
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"


// Case statement
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


// for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],]

var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)


// While loop
var n = 2
while n < 100 {
    n = n * 2
}
print(n)
var m = 2

repeat {
    m = m * 2
} while m < 100
print(m)


// range exclude last
var total = 0
for i in 0..<4 {
    total += i
}
print(total)


// range include last
var total2 = 0
for i in 0...4 {
    total2 += i
}
print(total2)


// Functions and closures
func greet(person: String, day: String) -> String {    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")


// Custom argument label, or no argument label
func greet(_ person: String, on day: String) -> String {    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


// tuple
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)


// varargs
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)


// Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()


// Function return types
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


// function parameter
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


// closure
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})


// Single statement closure
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)


// refer to parameters by number instead of by name
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

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


enum OddEven: ExampleProtocol {
    case odd, even
}
