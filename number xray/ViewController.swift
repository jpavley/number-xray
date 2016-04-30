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
         isEven,
         isOdd,
         isPrime,
         PrimeFactors
}

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberTable: UITableView!
    
    let rowCount = 7
    let numberCount = 20
    
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
    
    func binaryFormat(candidate:Int) -> String {
        return "10110111"
    }
    
    func hexFormat(candidate:Int) -> String {
        return "0x12aF0"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        var result:String = ""
        let sliderNUmber = Int(slider.value * Float(numberCount))
        
        if let someRow = RowKind(rawValue: indexPath.row) {
            
            switch someRow {
            case .Decimal:
                result = "Decimal: \(sliderNUmber)"
                
            case .Binary:
                result = "Binary: \(binaryFormat(sliderNUmber))"
                
            case .Hex:
                result = "Hex: \(hexFormat(sliderNUmber))"
                
            case .isEven:
                result = "Is Even? \((sliderNUmber % 2) == 0)"
                
            case .isOdd:
                result = "Is Odd? \((sliderNUmber % 2) != 0)"
                
            case .isPrime:
                result = "Is Prime? \(isPrime(sliderNUmber))"
                
            case .PrimeFactors:
                result = "Is Prime Factors: \(PrimeFactors(sliderNUmber))"
                
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

