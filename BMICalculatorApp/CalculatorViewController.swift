//
//  CalculatorViewController.swift
//  BMICalculatorApp
//
//  Created by Harsh Keshwala on 2018-12-13.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit
import CoreData

class CalculatorViewController: UIViewController {

    
    
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputWeight: UITextField!
    
    @IBOutlet weak var inputHeight: UITextField!
    
    @IBOutlet weak var standardUnit: UISegmentedControl!
    
    @IBOutlet weak var bmiResult: UILabel!
    
    @IBOutlet weak var bmiMessage: UILabel!
    var calculatedBMI:Double = 0.0
    var message = ""
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
        //print(title)
        
        
        let height = Double(inputHeight.text!)
        let weight = Double(inputWeight.text!)
        let name = inputName.text!
        
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
        //print(message)
        bmiMessage.text! = "You are \(message)"
        
        storeDataInEntity(_name: name, _bmi: calculatedBMI, _message: message)
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
        //return String(_bmi)
        if(_bmi < 16.0)
        {
            return "Severely Thin"
        }
        else if(_bmi < 16.99)
        {
            return "Moderately Thin"
        }
        else if(_bmi < 18.49)
        {
            return "Slightly Thin"
            
        }
        else if(_bmi < 24.99)
        {
            return "Normal"
        }
        else if(_bmi < 29.99)
        {
            return "Overweight"
        }
        else if(_bmi < 34.99)
        {
            return "Moderately Obese"
        }
        else if(_bmi < 39.99)
        {
            return "Severely Obese"
        }
        else
        {
            return "Very Severely Obese"
        }
    }
    
    func storeDataInEntity(_name:String, _bmi:Double, _message:String)
    {
        let data = NSEntityDescription.insertNewObject(forEntityName:"BMIEntity", into: context)
        data.setValue(_name, forKey: "name")
        data.setValue(_bmi, forKey: "bmi")
        data.setValue(_message, forKey: "msg")
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
    
}
