import Foundation


// Array of integers
var array = [1, 3, 5, 7]
for i in array {
    print(i)
}


// Array of Strings
var names = ["royce", "michelle", "rye", "lucy"]
for name in names {
    print(name)
}


// Loop with index and value
for (index, value) in names.enumerated() {
    print("\(index): \(value)")
}

