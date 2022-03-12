//
//  WelcomeViewController.swift
//  MyProfile
//
//  Created by Алексей Зарудный on 12.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var user = ""
    
    @IBOutlet var welcomeLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLable.text = user
    }
}
