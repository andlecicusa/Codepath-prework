//
//  ViewController.swift
//  Prework
//
//  Created by Grace Liu on 2022/7/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
        let tip1 = "15"
        let tip2 = "18"
        let tip3 = "20"
        tipControl.setTitle(tip1 + "%", forSegmentAt: 0)
        tipControl.setTitle(tip2 + "%", forSegmentAt: 1)
        tipControl.setTitle(tip3 + "%", forSegmentAt: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        if let tip1 = defaults.string(forKey: "tip1"),
        let tip2 = defaults.string(forKey: "tip2"),
        let tip3 = defaults.string(forKey: "tip3") {
            tipControl.setTitle(tip1 + "%", forSegmentAt: 0)
            tipControl.setTitle(tip2 + "%", forSegmentAt: 1)
            tipControl.setTitle(tip3 + "%", forSegmentAt: 2)
        } else {
            print("something is off when setting tips!")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        if var tipPercentage = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex) {
            tipPercentage = String(tipPercentage.dropLast())
            let percentage = Double(tipPercentage) ?? 0.0
            let tip = bill * (percentage / 100.0)
            let total = bill + tip
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
        } else {
            print(tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)!)
            print("error when handling tip calculation")
        }
    }
}

