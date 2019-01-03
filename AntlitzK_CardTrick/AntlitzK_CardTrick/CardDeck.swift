//
//  CardDeck.swift
//  AntlitzK_CardTrick
//
//  Created by Katherine Antlitz on 3/12/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import Foundation

var SelectedCard = Card(rank: Rank.Two, suit: Suit.Clubs)

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

struct Deck {
    var deck = [Card]()
    
    init(){
            let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
            let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
            for suit in suits {
                for rank in ranks {
                    self.deck.append(Card(rank: rank, suit: suit))
                }
            }
    }
    
    subscript(x: Int) -> Card {
        get {
            return deck[x]
        }
        set {
            deck[x] = newValue
        }
    }
    
    mutating func shuffle(){
        if self.deck.count > 1
        {
            for i in 0..<(self.deck.count - 1) {
                let j = Int(arc4random_uniform(UInt32(self.deck.count - 1)))
                if i != j {
                    swap(&self.deck[i], &self.deck[j])
                }
            }
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    public func imageName() -> String {
        return "\(rank.simpleDescription())_of_\(suit.simpleDescription())"
    }
}
