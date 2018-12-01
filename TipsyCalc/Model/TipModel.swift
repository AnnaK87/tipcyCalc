//
//  TipModel.swift
//  TipsyCalc
//
//  Created by Anna Kaukh on 11/24/18.
//  Copyright © 2018 Anna Kaukh. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _splitNumber: Double = 0
    private var _splitAmount: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var splitNumber: Double {
        get {
             return _splitNumber
        }
        set {
            _splitNumber = newValue
        }
    }
    
    var splitAmount: Double {
        get {
            return _splitAmount
        }
        set {
            _splitAmount = newValue
        }
    }
    
    init (billAmount: Double, tipPercent: Double, splitNumber: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitNumber = splitNumber
    }
    
    func calculateTips() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
       _splitAmount = totalAmount / splitNumber / 100
    }
}
