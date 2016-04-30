//
//  ViewController.swift
//  number xray
//
//  Created by John Pavley on 4/29/16.
//  Copyright © 2016 Epic Loot. All rights reserved.
//

import UIKit

enum RowKind: Int {
    case Decimal = 0,
         Binary,
         Hex,
         Parity,
         isPrime,
         PrimeFactors
}

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberTable: UITableView!
    
    let rowCount = 6
    let numberCount = 30
    
    @IBAction func siderValueChanged(sender: AnyObject) {
        numberTable.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func isPrime(candidate:Int) -> Bool {
        return false
    }
    
    func PrimeFactors(candidate:Int) -> [Int] {
        return [1,2,3,4,5]
    }
    
    func parity(candidate:Int) -> String {
        var result = "Odd"
        if (candidate % 2) == 0 {
            result = "Even"
        }
        return result
    }
    
    func convertBase(base10Number: Int, newBase: Int) -> String {
        
        // NOTE
        // - Converts the base of a Int from decimal to any base between 2 and 16.
        // - Returns a string representation of the converted number
        // - Returns empty string on inout error
        
        var result = ""
        var number = base10Number
        var remainer = 0
        let digits = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
        var remainders:[Int] = []
        
        if newBase < 2 || newBase > 16 {
            result = ""
            return result
        }
        
        while number > 0 {
            remainer = number % newBase
            remainders.append(remainer)
            number = number / newBase
        }
        
        for item in remainders.reverse() {
            result = result + String(digits[item])
        }
        
        
        return result
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        var result:String = ""
        let sliderNumber = Int(slider.value * Float(numberCount))
        
        if let someRow = RowKind(rawValue: indexPath.row) {
            
            switch someRow {
            case .Decimal:
                result = "Decimal: \(sliderNumber)"
                
            case .Binary:
                result = "Binary: \(convertBase(sliderNumber, newBase: 2))"
                
            case .Hex:
                result = "Hex: \(convertBase(sliderNumber, newBase: 16))"
                
            case .Parity:
                result = "Parity \(parity(sliderNumber))"
                
            case .isPrime:
                result = "Is Prime? \(isPrime(sliderNumber))"
                
            case .PrimeFactors:
                result = "Is Prime Factors: \(PrimeFactors(sliderNumber))"
                
            }
            
        }
        
        cell.textLabel?.text = result
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

