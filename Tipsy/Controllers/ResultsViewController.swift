//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Garrett Keyes on 12/29/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var splitBillValue: Float = 0.0
    var numberOfSpliters: Float = 0.0
    var tipAmount: String = "10%"
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(format: "%.2f",splitBillValue)
        settingsLabel.text = "Split between \(String(format: "%.0f",numberOfSpliters)) people, with \(tipAmount) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
