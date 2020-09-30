//
//  ViewController.swift
//  KevinHao-Lab1
//
//  Created by Snow Hao on 9/28/20.
//  Copyright © 2020 Kevin Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var originalPrice: UITextField!
    @IBOutlet weak var discountPercent: UITextField!
    @IBOutlet weak var salesTaxPercent: UITextField!
    @IBOutlet weak var giftCard: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var shippingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func finalPriceCalculation(_ sender: Any) {
        //setting optional variables
               var originalPriceVal: Double? = Double(originalPrice.text!) ?? 0
               var discountPercentVal: Double? = Double(discountPercent.text!) ?? 0
               var salesTaxPercentVal: Double? = Double(salesTaxPercent.text!) ?? 0
               var giftCardVal: Double? = Double(giftCard.text!) ?? 0
        
               //Checking edge cases
               if originalPriceVal! < 0.0 {
               originalPriceVal = 0.0
               }
               if discountPercentVal! > 100.0{
               discountPercentVal = 100.0
               }
               if discountPercentVal! < 0.0{
               discountPercentVal = 0.0
               }
               if salesTaxPercentVal! < 0.0{
               salesTaxPercentVal = 0.0
               }
        if giftCardVal! < 0.0 {
            giftCardVal = 0.0
        }
                                         
               //Calculate the final price
               var temp = (originalPriceVal! * (1 - (discountPercentVal!)/100.0)) * (1 + (salesTaxPercentVal! / 100.0))
        if(shippingSwitch.isOn){
                   temp += 4.99
               }
            else{
                temp += 0
        }
                var finalPriceCalc = temp - giftCardVal!
                
               finalPrice.text = "$\(String(format: "%.2f", finalPriceCalc))"
               

           }
          
    }
   

