//
//  DrawingView.swift
//  MasonKelber-Lab3
//
//  Created by Mason Kelber on 10/25/20.
//  Copyright © 2020 MasonKelber. All rights reserved.
//

import Foundation
import UIKit

class DrawingView: UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var line: Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    var lines: [Line] = []{
         didSet{
            setNeedsDisplay()
        }
    }
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let xCoord = (first.x + second.x)/2
        let yCoord = (first.y + second.y)/2
        return CGPoint(x: xCoord, y: yCoord)
    }
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
     let path = UIBezierPath() //Create the path object
     if(points.count < 2){ //There are no points to add to this path
        return path
     }
     path.move(to: points[0]) //Start the path on the first point
     for i in 1..<points.count - 1{
     let firstMidpoint = midpoint(first: path.currentPoint, second: points[i]) //Get midpoint between the path's last point and the next one in the array
     let secondMidpoint = midpoint(first: points[i], second: points[i+1]) //Get midpoint between the next point in the array and the one after it
     path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
     }
     return path
    }
    
    func drawLine(_ line: Line){
        line.color.setFill()
        line.color.setStroke()
        let path = createQuadPath(points: line.points)
        path.lineWidth = line.width
        path.stroke()
    }
    
    func drawCircle(_ circle: Line){
        circle.color.setFill()
        let path = UIBezierPath()
        path.addArc(withCenter: circle.points[0], radius: (circle.width/2), startAngle: 0, endAngle: CGFloat((Float.pi * 2)), clockwise: true)
        path.fill()
    }
    
    override func draw(_ rect: CGRect){
        for line in lines{
            drawCircle(line)
            if(line.points.count > 1){
                drawLine(line)
                var endPoint = line
                endPoint.points = [endPoint.points[endPoint.points.count-1]]
                drawCircle(endPoint)
            }
            drawCircle(line)
        }
        if line != nil {
            drawCircle(line!)
            if(line?.points.count ?? 0 > 1){
                drawLine(line!)
                var endPoint = line
                endPoint!.points = [endPoint!.points[endPoint!.points.count - 1]]
                drawCircle(endPoint!)
            }
            
        }
    }
}
