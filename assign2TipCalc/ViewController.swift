//
//  ViewController.swift
//  assign2TipCalc
//
//  Created by Madison Pahl on 3/10/16.
//  Copyright © 2016 Madison Pahl. All rights reserved.
//
extension String{
    var doubleValue : Double {
        return (self as NSString).doubleValue
    }
}

func textFieldShouldReturn(userText: UITextField!) -> Bool {
    userText.resignFirstResponder()
    return true;
}

import UIKit

class ViewController: UIViewController {
    
    var tipTotal: Double = 0
    var tipPercent: Double = 0
    var totalPrice: Double = 0

    @IBOutlet weak var priceTextBox: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var ratingSelect: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: AnyObject) {
        
        textFieldShouldReturn(priceTextBox)
        
       
        
        totalPrice = (priceTextBox.text! as NSString).doubleValue
        
        if (ratingSelect.selectedSegmentIndex == 0 || ratingSelect.selectedSegmentIndex == 1 ||
            ratingSelect.selectedSegmentIndex == 2){
            tipPercent = 0.10
        }
        else if (ratingSelect.selectedSegmentIndex == 3 ||
            ratingSelect.selectedSegmentIndex == 4){
            tipPercent = 0.13
        }
        else if (ratingSelect.selectedSegmentIndex == 5 ||
            ratingSelect.selectedSegmentIndex == 6){
            tipPercent = 0.15
        }
        else if (ratingSelect.selectedSegmentIndex == 7 ||
            ratingSelect.selectedSegmentIndex == 8){
            tipPercent = 0.20
        }
        else if (ratingSelect.selectedSegmentIndex == 9){
            tipPercent = 0.25
        }
        
        
        tipTotal = totalPrice * tipPercent
        tipTotal = Double(round(100*tipTotal)/100)
        
        self.tipLabel.text = "$\(tipTotal)"
        
    }

}

