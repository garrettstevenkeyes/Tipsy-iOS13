//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var selectedTip: String = "10%"
    var convertedTip: Float = 0.1
    var finalBill: Float = 0.0
    var billSpliters: Float = 2.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        selectedTip = sender.currentTitle ?? "10%"
        switch selectedTip {
            case "0%":
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                
                convertedTip = 0.0
            case "20%":
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                
                convertedTip = 0.2
            default:
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                
                convertedTip = 0.1
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value) 
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billAmount = Float(billTextField.text ?? "0.0") ?? 0.0
        billSpliters = Float(splitNumberLabel.text ?? "2") ?? 2.0
        billTextField.endEditing(true)
        finalBill = (billAmount + (billAmount * convertedTip))/billSpliters
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitBillValue = finalBill
            destinationVC.numberOfSpliters = billSpliters
            destinationVC.tipAmount = selectedTip
        }
    }
}

