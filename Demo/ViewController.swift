//
//  ViewController.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 24/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblMain: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEV
        lblMain.text = "This is a Development Environment"
        #elseif PROD
        lblMain.text = "This is a Production Environment"
        #else
        lblMain.text = "This is a No Environment for a child"
        #endif
        
        lbl1.text = "lbl1".localize() // only need to handle this specific lable text
        lbl2.text = String(localized: "lbl2") // you might have used R.swift, that would work too
        lbl3.text = String(localized: "lbl3") // you might have used R.swift, that would work too
    }
}


extension String {
    
    func localize() -> String {
        var value = Bundle.main.localizedString(forKey: self, value: nil, table: "TragetStringsDev")
        
        if value.isEmpty || value == self {
            value = Bundle.main.localizedString(forKey: self, value: nil, table: "TragetStringsProd")
        }
        
        if value.isEmpty || value == self {
            value = Bundle.main.localizedString(forKey: self, value: "\(self) Not found", table: "Localizable")
        }
        return value
    }
}
