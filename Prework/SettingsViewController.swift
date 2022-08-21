//
//  SettingsViewController.swift
//  Prework
//
//  Created by Tobey Yang on 2022/8/21.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        if tipOne.text!.isEmpty {
            tipOne.text = "15"
        }
        if tipTwo.text!.isEmpty {
            tipTwo.text = "18"
        }
        if tipThree.text!.isEmpty {
            tipThree.text = "20"
        }
        defaults.set(tipOne.text, forKey: "tip1")
        defaults.set(tipTwo.text, forKey: "tip2")
        defaults.set(tipThree.text, forKey: "tip3")
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
