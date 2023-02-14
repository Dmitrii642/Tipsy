//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Дмитрий Яковлев on 13.02.2023.
//

import UIKit

class CalculateViewController: UIViewController {

   
    
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var calculateBotton: UIButton!
    @IBOutlet weak var percentCountSlider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
  
    var tip = 0.0
  var numberOfGeest = 2
    var totalSum = 0.0
    var finalValue = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tip = 10
        percentLabel.text = "\(10)%"
        
        calculateBotton.layer.cornerRadius = 10
    
        billTotal.keyboardType = .decimalPad
       
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        stepper.value = 2
        stepper.minimumValue = 2
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    


    
    @IBAction func stepperAction(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfGeest = Int(sender.value)
    }
    
    
    
    @IBAction func percentCountSliderAction(_ sender: UISlider) {
        
        percentLabel.text = String(format: "%.0f", sender.value)
        tip = Double(Int(sender.value))
    }
    
    
    @IBAction func calculateAction(_ sender: UIButton) {
        
        let currentSum = billTotal.text!
        
        if currentSum != "" {
            totalSum = Double(currentSum)!
            tip = tip / 100
            let result = totalSum * (1 + tip) / Double(numberOfGeest)
            finalValue = String(format: "%.2f", result)
        }
        
        self.performSegue(withIdentifier: "resultVC", sender: self)
        
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalValue
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfGeest
            
        }
        
        
    }
    

}

extension CalculateViewController:UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}
