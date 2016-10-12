public enum Suit {
    case spades, hearts, diamonds, clubs
    
    public static let allValues = [spades, hearts, diamonds, clubs]
    
    public func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    public func color() -> String {
        switch self {
        case .spades, .clubs:
            return "Black"
        case .hearts, .diamonds:
            return "Red"
        }
    }
}
