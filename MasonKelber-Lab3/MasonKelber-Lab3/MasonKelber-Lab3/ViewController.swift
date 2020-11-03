//
//  ViewController.swift
//  MasonKelber-Lab3
//
//  Created by Mason Kelber on 10/25/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var orange: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var purple: UIButton!
    @IBOutlet weak var black: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var undo: UIButton!
    @IBOutlet weak var pen: UIButton!
    @IBOutlet weak var marker: UIButton!
    
    @IBOutlet weak var widthSlider: UISlider!
    
    
    @IBOutlet weak var canvas: DrawingView!
    var currentLine:Line!
    var currentColor:UIColor!
    var sliderValue = CGFloat(3.5)
    var penBool: Bool!
    var markerBool: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentColor = UIColor.red
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 1
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 0.5
        pen.alpha = 1
        marker.alpha = 0.5
        penBool = true
        markerBool = false
    }

    
    @IBAction func RedPressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 1
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 0.5
        currentColor = UIColor.red
        currentLine?.color = currentColor
    }
    
    
    @IBAction func OrangePressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 0.5
        black.alpha = 0.5
        orange.alpha = 1
        yellow.alpha = 0.5
        purple.alpha = 0.5
        currentColor = UIColor.orange
        currentLine?.color=currentColor
    }
        
    
    
    @IBAction func YellowPressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 0.5
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 1
        purple.alpha = 0.5
        currentColor = UIColor.yellow
        currentLine?.color=currentColor
    }

    @IBAction func GreenPressed(_ sender: Any) {
        green.alpha = 1
        blue.alpha = 0.5
        red.alpha = 0.5
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 0.5
        currentColor = UIColor.green
        currentLine?.color=currentColor
    }
    
    @IBAction func BluePressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 1
        red.alpha = 0.5
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 0.5
        currentColor = UIColor.blue
        currentLine?.color=currentColor
    }
    
    @IBAction func PurplePressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 0.5
        black.alpha = 0.5
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 1
        currentColor = UIColor.purple
        currentLine?.color=currentColor
    }

    @IBAction func BlackPressed(_ sender: Any) {
        green.alpha = 0.5
        blue.alpha = 0.5
        red.alpha = 0.5
        black.alpha = 1
        orange.alpha = 0.5
        yellow.alpha = 0.5
        purple.alpha = 0.5
        currentColor = UIColor.black
        currentLine?.color=currentColor
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        if(penBool){
            sliderValue = 5 * CGFloat(sender.value) + 1
        }else if(markerBool){
            sliderValue = 5 * CGFloat(sender.value) + 15
        }
        
        currentLine?.width = sliderValue
    }
    
    //creative portion part 1

    @IBAction func clearPressed(_ sender: Any) {
        canvas.line = nil
        canvas.lines = []
    }
    
    @IBAction func undoPressed(_ sender: Any) {
        if(!canvas.lines.isEmpty){
            canvas.line = nil
            canvas.lines.remove(at: canvas.lines.count-1)
        }
    }
    
    //Different Pens(Creative Portion 1)
    @IBAction func penOn(_ sender: Any) {
        penBool = true
        markerBool = false
        pen.alpha = 1.0
        marker.alpha = 0.5
        sliderMoved(widthSlider)
    }
    
    @IBAction func MarkerOn(_ sender: Any) {
        penBool = false
        markerBool = true
        pen.alpha = 0.5
        marker.alpha = 1.0
        sliderMoved(widthSlider)
    }
    
    //Save Drawing(Creative Portion 2)
    // https://www.youtube.com/watch?v=kAiknPhkWmc&vl=en&ab_channel=LetCreateAnApp
    //and https://www.youtube.com/watch?v=0IvkfWl4uoI&ab_channel=SeemuApps were used to learn how to save a portion of the screen
    @IBAction func savePressed(_ sender: Any) {
         let renderer = UIGraphicsImageRenderer(size: canvas.bounds.size)
                      let screenshot = renderer.image { ctx in
                          canvas.drawHierarchy(in: canvas.bounds, afterScreenUpdates: true)
                      }
                      //convert from  to UIImage to PNG
                      let toPNG = screenshot.pngData()
                      let compress = UIImage(data: toPNG!)
                      UIImageWriteToSavedPhotosAlbum(compress!, nil, nil, nil)
                      
                      let alert = UIAlertController(title: "Saved", message: "Your drawing has been saved!", preferredStyle: .alert)
                      let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
                      alert.addAction(okAction)
                      self.present(alert, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touchPoint = touches.first?.location(in: canvas) else {return}
        currentLine = Line(points: [touchPoint], width: sliderValue, color: currentColor)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: canvas) else {return}
        currentLine?.points.append(touchPoint)
        canvas.line = currentLine
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: canvas) else {return}
        currentLine?.points.append(touchPoint)
        canvas.line = currentLine
        canvas.lines.append(currentLine)
        currentLine = nil
    }
    
}

