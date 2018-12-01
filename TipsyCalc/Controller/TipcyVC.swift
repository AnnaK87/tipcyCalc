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
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitNumberstLbl: UILabel!
    @IBOutlet weak var splitAmountToPayLbl: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, splitNumber: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCaluclationValues()
        updateUI()
    }
    
    func setTipCaluclationValues() {
        tip.tipPercent = Double(tipPercentSlider.value)
        tip.billAmount = ((billAmountTxtField.text)! as NSString).doubleValue
        tip.splitNumber = Double(splitSlider.value)
        tip.calculateTips()
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
        splitNumberstLbl.text = "Split for \(Int(splitSlider.value * 100)):"
        splitAmountToPayLbl.text = String(format: "$%0.2f", tip.splitAmount)
    }
    
    func roundValueOfSlider(sender: UISlider) {
        let steps: Float = 100
        
        let roundValue = round(sender.value * steps) / steps
        sender.value = roundValue
    }
    
    @IBAction func billAmountEntered(_ sender: Any) {
        setTipCaluclationValues()
        updateUI()
      
    }
    
    @IBAction func tipPercentChanged(_ sender: UISlider) {
       roundValueOfSlider(sender: sender)
        setTipCaluclationValues()
        updateUI()
    }
    
    @IBAction func splitSliderChanged(_ sender: UISlider) {
       roundValueOfSlider(sender: sender)
        setTipCaluclationValues()
        updateUI()
    }
    
}

