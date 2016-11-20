for i in 1...10 {
    print("\(i)")
}


func add(num1: Int, a num2: Int) -> Double {
    return Double(num1) + Double(num2)
}

add(1, a: 2)


class Rectangle {
    let width: Int
    let height: Int
    
    init(_ width: Int, _ height: Int) {
        self.width = width
        self.height = height
    }
    
    func getArea() -> Int {
        return width * height
    }
}

let rect = Rectangle(100, 200)
