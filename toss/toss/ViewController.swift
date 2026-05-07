//
//  ViewController.swift
//  toss
//
//  Created by Piyush Sharma on 07/05/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tossStart: UIImageView!
    
    var tossProbality = [UIImage(imageLiteralResourceName: "tossHead"),UIImage(imageLiteralResourceName: "tossTail")]
    
  
    @IBAction func tossTap(_ sender: Any) {
        tossStart.image = tossProbality.randomElement()
        print("app is runing")
    }
    

}

