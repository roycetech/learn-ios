// extension
import CoreData


func greetThenRunClosure(name: String, closure: (String) -> Void) {
    closure("Dog")
}

greetThenRunClosure(name: "Paul") { (frc) in
    print("\(frc)")
}

class Executor {
    init(name: String, callback: () -> Void) {
        callback()
    }
}

let exec = Executor(name: "John") { () in
    print("Executed")
}