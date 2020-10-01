//
//  ViewController.swift
//  MasonKelber-Lab1
//
//  Created by Snow Hao on 9/30/20.
//  Copyright © 2020 Kevin Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var original: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var shippingCost: UILabel!
    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func priceCalculator(_ sender: Any) {
        var originalPrice: Double? = Double(original.text!) ?? 0
                var discountRate: Double? = Double(discount.text!) ?? 0
                var salesTax: Double? = Double(tax.text!) ?? 0
                var itemWeight: Double? = Double(weight.text!) ?? 0

              
                //Edge Cases
                if originalPrice! < 0.0 {
                    originalPrice = 0.0
                }
                
                if discountRate! < 0.0 {
                    discountRate = 0.0
                }
                
                if discountRate! > 100.0 {
                    discountRate = 100.0
                }
                
                if salesTax! < 0.0 {
                    salesTax = 0.0
                }

                let itemPrice = (originalPrice! * (1.0 - (discountRate!)/100)) * (1.0 + (salesTax!)/100)
                finalPrice.text = "$\(String(format: "%.2f", itemPrice))"
                
        //Shipping cost equal to arbitrary assignment of 1/2 item weight + $10
                //itemWeight edge case
                if itemWeight! < 0.0 {
                    itemWeight = 0.0
                }

               var shippingPrice = itemWeight! * 0.5 + 10.0

                if(itemPrice/(1.0 + (salesTax!) / 100) >= 100.0){
                    shippingPrice = shippingPrice * 0.5
                }
                shippingCost.text = "$\(String(format: "%.2f", shippingPrice))"
        }

}

