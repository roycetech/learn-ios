import Foundation

class Square {
    
    func draw() {
        print("Draw Square")
    }
    
}


/**
let customSquare = Square() {
    override func draw() {
        print("Custom")
    }
}
*/

let square = Square()


print(String(describing: type(of: square)))

print(1)



