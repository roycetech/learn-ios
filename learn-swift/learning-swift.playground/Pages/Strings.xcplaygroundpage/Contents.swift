import Foundation

let path = "/Users/royce/Library/Developer/CoreSimulator/Devices/E3F88471-422D-49D1-BFB8-23D95C541C2F/data/Containers/Data/Application/DFEC9217-8990-444B-BDBF-89121B7F5A53/Documents/"

let replaced = path.replacingOccurrences(of: "Documents/", with: "")


let seconds = 59

let secondPart = String(format: "%02d", seconds % 60)
let minutePart = String(format: "%02d", seconds / 60)

"\(minutePart):\(secondPart)"


// Print each character in a string
let hello = "Hello world"
for char in hello.characters {
    print(char)
}

// Substring
//hello.substring(to: 3)

let nsstring = NSString(string: "Hello NSString")
nsstring.substring(to: 5)
nsstring.substring(from: 5)
nsstring.substring(with: NSRange(location: 3, length: 3))

// Contains
if nsstring.contains("lo") {
    print("you")
}

// Split
nsstring.components(separatedBy: " ")


nsstring.uppercased
nsstring.lowercased
