//
//  ThirdViewController.swift
//  AntlitzK_CardTrick
//
//  Created by Katherine Antlitz on 3/12/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBAction func wikipediaLink(_ sender: UIButton) {
        if let url = URL(string: "https://en.wikipedia.org/wiki/Twenty_One_Card_Trick") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    @IBAction func easyTricksLink(_ sender: UIButton) {
        if let url = URL(string: "http://mentalismknowledge.com/10-card-tricks-everyone-can-learn/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func trickShopLink(_ sender: UIButton) {
        if let url = URL(string: "http://www.pjstrickshop.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func howItWorksLink(_ sender: UIButton) {
        if let url = URL(string: "http://www.cs4fn.org/mathemagic/cardshuffle.php") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
