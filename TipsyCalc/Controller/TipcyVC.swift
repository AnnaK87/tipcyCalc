//
//  ViewController.swift
//  TipsyCalc
//
//  Created by Anna Kaukh on 11/24/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import UIKit

class TipcyVC: UIViewController {
    
    @IBOutlet weak var billAmountTxtField: UITextField!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCaluclationValues()
        updateUI()
    }
    
    func setTipCaluclationValues() {
        tip.tipPercent = Double(tipPercentSlider.value)
        print(tip.tipPercent)
        tip.billAmount = ((billAmountTxtField.text)! as NSString).doubleValue
        tip.calculateTips()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
    @IBAction func billAmountEntered(_ sender: Any) {
        setTipCaluclationValues()
        updateUI()
    }
    
    @IBAction func tipPercentChanged(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue

        setTipCaluclationValues()
        updateUI()
    }
    
    
}

