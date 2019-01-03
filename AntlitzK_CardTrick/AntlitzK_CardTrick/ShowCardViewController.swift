//
//  ShowCardViewController.swift
//  AntlitzK_CardTrick
//
//  Created by Katherine Antlitz on 3/14/17.
//  Copyright © 2017 DePaul University. All rights reserved.
//

import UIKit

class ShowCardViewController: UIViewController {
    @IBOutlet weak var imageCard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageCard.image = UIImage(named:SelectedCard.imageName())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RestartTrick", sender: self)
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        self.performSegue(withIdentifier: "RestartTrick", sender: self)
    }
}
