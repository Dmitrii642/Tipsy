//
//  CalculateTipsy.swift
//  Tipsy
//
//  Created by Дмитрий Яковлев on 13.02.2023.
//

import Foundation

struct CalculateTipsy {
    
    var tipsy: Tipsy?
    
    let totalSum: Int?
    let numberOfPercentages: Int?
    let numberOfGeest: Int?
    
    
    func calculateSum(totalSum: Int, numberOfPercentages: Int, numberOfGeest: Int) {
        
        let tipsyValue = (totalSum / numberOfPercentages) + numberOfGeest
        
    }
    
    mutating func getTipsy() {
        tipsy = 5
    }
    
    
    
    
    
    
}
