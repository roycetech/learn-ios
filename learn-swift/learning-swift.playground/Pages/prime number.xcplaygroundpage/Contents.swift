// Check if x is wholly divisible any number between 1 and itself.
func isPrime(_ x: Int) -> Bool {
    if x > 1 {
        var factors = 0
        for i in 2..<x {
            if x % i == 0 {
                factors += 1
            }
        }
        return factors == 0
    }
    return false
}

isPrime(4)

for i in 0...100 {
    print("\(i) is \(isPrime(i))")
}

