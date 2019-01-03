//
//  FirstViewController.swift
//  AntlitzK_CardTrick
//
//  Created by Katherine Antlitz on 3/12/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var rowOne: [UIImageView]!
    @IBOutlet var rowTwo: [UIImageView]!
    @IBOutlet var rowThree: [UIImageView]!
    @IBOutlet weak var lblInstructions: UILabel!
    
    var deckOne = [Card]()
    var deckTwo = [Card]()
    var deckThree = [Card]()
    var deal = 0
    
    func dealNewDeck()
    {
        var deck = Deck.init()
        deck.shuffle()
        dealCards(deck.deck)
    }
    
    func dealCards(_ deck: [Card]){
        deckOne = [Card]()
        deckTwo = [Card]()
        deckThree = [Card]()
        
        for i in stride(from: 0, to: 21, by: 3) {
            deckOne.append(deck[i])
            deckTwo.append(deck[i + 1])
            deckThree.append(deck[i + 2])
        }
        
        for i in 0...6 {
            let cardOne = deckOne[i]
            rowOne[i].image = UIImage(named:cardOne.imageName())
            let cardTwo = deckTwo[i]
            rowTwo[i].image = UIImage(named:cardTwo.imageName())
            let cardThree = deckThree[i]
            rowThree[i].image = UIImage(named:cardThree.imageName())
        }
    }
    
    func nextSection(_ selectedDeck: [Card], _ deck1: [Card], _ deck2: [Card]){
        switch deal {
        case 0:
            lblInstructions.text = "Please select which row your card is in again."
            dealCards(deck1 + selectedDeck + deck2)
            deal = deal + 1
        case 1:
            lblInstructions.text = "Please select which row your card is in one last time."
            dealCards(deck1 + selectedDeck + deck2)
            deal = deal + 1
        case 2:
            SelectedCard = selectedDeck[3]
            self.performSegue(withIdentifier: "openShowCard", sender: self)
            lblInstructions.text = "Welcome!  Please pick a card and select which row it is in."
            deal = 0
            dealNewDeck()
        default:
            break
        }
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        lblInstructions.text = "Welcome!  Please pick a card and select which row it is in."
        deal = 0
        dealNewDeck()
    }
    
    @IBAction func rowOneSelected(_ sender: UIButton) {
        nextSection(deckOne, deckTwo, deckThree)
    }
    
    @IBAction func rowTwoSelected(_ sender: UIButton) {
        nextSection(deckTwo, deckOne, deckThree)
    }
    
    @IBAction func rowThreeSelected(_ sender: UIButton) {
        nextSection(deckThree, deckOne, deckTwo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dealNewDeck()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

