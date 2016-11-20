import Foundation

let path = "/Users/royce/Library/Developer/CoreSimulator/Devices/E3F88471-422D-49D1-BFB8-23D95C541C2F/data/Containers/Data/Application/DFEC9217-8990-444B-BDBF-89121B7F5A53/Documents/"

let replaced = path.replacingOccurrences(of: "Documents/", with: "")


let seconds = 59

let secondPart = String(format: "%02d", seconds % 60)
let minutePart = String(format: "%02d", seconds / 60)

"\(minutePart):\(secondPart)"
