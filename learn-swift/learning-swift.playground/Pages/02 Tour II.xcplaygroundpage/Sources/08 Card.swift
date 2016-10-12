public struct Card {
    
    var rank: Rank
    var suit: Suit
    
    
    public init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    
    public func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    public static func createFullDeck() -> [Card] {
        var fullDeck: [Card] = []
        for suit in Suit.allValues {
            for rank in Rank.allValues {
                fullDeck.append(Card(rank: rank, suit: suit))
            }
        }
        return fullDeck
    }
    
}
