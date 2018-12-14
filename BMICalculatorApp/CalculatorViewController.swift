//
//  CalculatorViewController.swift
//  BMICalculatorApp
//
//  Created by Harsh Keshwala on 2018-12-13.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    
    @IBOutlet weak var inputWeight: UITextField!
    
    @IBOutlet weak var inputHeight: UITextField!
    
    @IBOutlet weak var standardUnit: UISegmentedControl!
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var bmiMessage: UILabel!
    var calculatedBMI:Double = 0.0
    var message = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateButton(_ sender: UIButton)
    {
        
        let title = standardUnit.titleForSegment(at: standardUnit.selectedSegmentIndex)
        print(title)
        
        
        let height = Double(inputHeight.text!)
        let weight = Double(inputWeight.text!)
     
        if title == "Metric"
        {
            calculatedBMI = calculateMetricBMI(_height: height!, _weight: weight!)
            let result = String(format: "%.1f", calculatedBMI)
            bmiResult.text! = "Your BMI is \(result)"
            
        }
        else if title == "Imperial"
        {
            calculatedBMI = calculateImperialBMI(_height: height!, _weight: weight!)
            let result = String(format: "%.1f", calculatedBMI)
            bmiResult.text! = "Your BMI is \(result)"
        }
        
        message = printMessage(_bmi: calculatedBMI)
        print(message)
    }
  
    func calculateMetricBMI(_height:Double, _weight:Double) -> Double
    {
        //print("you are in metric")
        
       return (_weight / (_height*_height))
    
        
    }
    
    func calculateImperialBMI(_height:Double, _weight:Double) -> Double
    {
        //print("You are in imperial")
        return ((_weight*703)/(_height*_height))
    }
    
    func printMessage(_bmi:Double) -> String
    {
        return String(_bmi)
    }
    
}
