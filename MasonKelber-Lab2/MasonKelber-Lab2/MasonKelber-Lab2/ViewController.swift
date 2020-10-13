//
//  ViewController.swift
//  MasonKelber-Lab2
//
//  Created by Mason Kelber on 10/12/20.
//  Copyright © 2020 Mason Kelber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var background: UIView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var bunnyImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    
    @IBOutlet weak var happinessLabel: UILabel!

    @IBOutlet weak var happinessBar: DisplayView!
    

  
    @IBOutlet weak var fullnessLabel: UILabel!
    @IBOutlet weak var fullnessBar: DisplayView!
    
    
    
    let pets = [Pet(name:"cat"),Pet(name:"dog"),Pet(name:"bird"),Pet(name:"fish"),Pet(name:"bunny")]
    var currentPet = 0
    let backgroundColors = [UIColor.blue,UIColor.red,UIColor.yellow,UIColor.magenta,UIColor.cyan]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        catImage.alpha = 1
        dogImage.alpha = 0
        birdImage.alpha = 0
        fishImage.alpha = 0
        bunnyImage.alpha = 0
        currentPet = 0
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        //updateDisplay()
    }
    
    
    @IBAction func play(_ sender: Any) {
        pets[currentPet].play()
        updateDisplay()
    }
    
    @IBAction func feed(_ sender: Any) {
        pets[currentPet].feed()
        updateDisplay()
    }

    @IBAction func catButton(_ sender: Any) {
        catImage.alpha = 1
        dogImage.alpha = 0
        birdImage.alpha = 0
        fishImage.alpha = 0
        bunnyImage.alpha = 0
        currentPet = 0
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        updateDisplay()
    }
    
    @IBAction func dogButton(_ sender: Any) {
        catImage.alpha = 0
        dogImage.alpha = 1
        birdImage.alpha = 0
        fishImage.alpha = 0
        bunnyImage.alpha = 0
        currentPet = 1
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        updateDisplay()
    }
    
    @IBAction func birdButton(_ sender: Any) {
        catImage.alpha = 0
        dogImage.alpha = 0
        birdImage.alpha = 1
        fishImage.alpha = 0
        bunnyImage.alpha = 0
        currentPet = 2
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        updateDisplay()
    }
    
    @IBAction func fishButton(_ sender: Any) {
        catImage.alpha = 0
        dogImage.alpha = 0
        birdImage.alpha = 0
        fishImage.alpha = 1
        bunnyImage.alpha = 0
        currentPet = 3
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        updateDisplay()
    }
    
    @IBAction func bunnyButton(_ sender: Any) {
        catImage.alpha = 0
        dogImage.alpha = 0
        birdImage.alpha = 0
        fishImage.alpha = 0
        bunnyImage.alpha = 1
        currentPet = 4
        background.backgroundColor = backgroundColors[currentPet]
        background.alpha = 0.7
        updateDisplay()
    }
    
    func updateDisplay(){
        happinessBar.color = backgroundColors[currentPet]
        fullnessBar.color = backgroundColors[currentPet]
        happinessBar.alpha = 0.7
        fullnessBar.alpha = 0.7
        happinessLabel.text = String(pets[currentPet].playCount)
        fullnessLabel.text = String(pets[currentPet].fedCount)
        happinessBar.animateValue(to: pets[currentPet].happiness / 10)
        fullnessBar.animateValue(to: pets[currentPet].hunger / 10)
        
       
    }
    
    
}

