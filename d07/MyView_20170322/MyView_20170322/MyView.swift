//
//  MyView.swift
//  MyView_20170322
//
//  Created by 김재정 on 2017. 3. 22..
//  Copyright © 2017년 jjaygim. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let color = [UIColor.red.cgColor, UIColor.blue.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: color, locations: nil)
        
        drawGradient(context: context!, gradiant: gradient!)
        drawLines(context: context!)
        drawArcs(context: context!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setNeedsDisplay()
    }
    
    func drawGradient(context: CGContext, gradiant: CGGradient) {
        let startPoint = CGPoint(x: self.bounds.width/2 , y: 0)
        let endPoint = CGPoint(x: self.bounds.width/2 , y: self.bounds.size.height)
        context.drawLinearGradient(gradiant, start: startPoint, end: endPoint, options: [])
    }
    
    func makeRandomStrokeColor(context: CGContext) {
        let red: Double = Double(arc4random_uniform(255)) / 255.0
        let green: Double = Double(arc4random_uniform(255)) / 255.0
        let blue: Double = Double(arc4random_uniform(255)) / 255.0
        let color = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        context.setStrokeColor(color.cgColor)
    }
    
    func drawLines(context: CGContext) {
        for _ in 1...10 {
            let startPoint = CGPoint(x: Int(arc4random_uniform(320)), y: Int(arc4random_uniform(568)))
            let endPoint = CGPoint(x: Int(arc4random_uniform(320)), y: Int(arc4random_uniform(568)))
            let path = UIBezierPath.init()
            path.move(to: startPoint)
            path.addLine(to: endPoint)
            path.lineWidth = CGFloat(arc4random_uniform(5)+1)
            //context.setStrokeColor(UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1).cgColor)
            makeRandomStrokeColor(context: context)
            path.stroke()
            context.addPath(path.cgPath)
            
        }
    }
    
    func drawArcs(context: CGContext) {
        for _ in 1...10 {
            let origin = CGPoint(x: Int(arc4random_uniform(320)), y: Int(arc4random_uniform(568)))
            let radius = CGFloat(Int(arc4random_uniform(160)))
            let startRadian = Double(arc4random_uniform(360)) * (M_PI*2 / 360)
            let path = UIBezierPath.init()
            path.move(to: origin)
            path.addArc(withCenter: origin, radius: radius, startAngle: CGFloat(startRadian), endAngle: CGFloat(startRadian+M_PI_4), clockwise: true)
            path.addLine(to: origin)
            path.lineWidth = 1
            path.stroke()
            makeRandomStrokeColor(context: context)
            context.addPath(path.cgPath)
            
        }
    }

}
        /*
        let color = [UIColor.red.cgColor, UIColor.blue.cgColor] as CFArray
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace, color: color, locations: nil)
 
        drawGr
        
        
        
        //UIColor.yellow.setFill()
        //UIRectFill(self.bounds)
        */


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


/*
 let gradientLayer = CAGradientLayer()
 gradientLayer.colors = [UIColor(red: (202 / 255.0), green: (197 / 255.0), blue: (52 / 255.0), alpha: 1.0).cgColor, UIColor(red: (253 / 255.0), green: (248 / 255.0), blue: (101 / 255.0), alpha: 1.0).cgColor]
 gradientLayer.bounds = bounds
 UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, true, 0.0)

*/

/*
// 1
let context = UIGraphicsGetCurrentContext()

// 2
context?.saveGState()

// 3
let colorSpace = CGColorSpaceCreateDeviceRGB()

// 4
let startColor = UIColor.red
guard let startColorComponents = startColor.cgColor.components else { return }

let endColor = UIColor.blue
guard let endColorComponents = endColor.cgColor.components else { return }

// 5
let colorComponents: [CGFloat]
    = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]

// 6
let locations:[CGFloat] = [0.0, 1.0]

// 7
guard let gradient = CGGradient(colorSpace: colorSpace, colorComponents: colorComponents, locations: locations, count: 2) else { return }

let startPoint = CGPoint(x: self.bounds.width, y: 0)
let endPoint = CGPoint(x: self.bounds.width,y: self.bounds.height)

// 8
context?.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))

// 9
context?.restoreGState()




 1. UIGraphicsGetCurrentContext gets the graphical context, this can be thought of as a canvas where there can be painted on.
 2. The graphical context is saved, so it can later be restored.
 3. CGColorSpace is a container for a range of colors. Almost always you will use the RGB color space.
 4. Here we define a start and an end color of the gradient. The cgColor object is a low-level definition of the color components. The components method extracts the color components from the cgColor object.
 5. In this array The RGB and Alpha color-components are written to an array.
 6. The location for each color provided in components.
 7. A CGGradient object is created containing the gradient info.
 8. Here the Gradient will be drawn following the vertical axis.
 9. The Graphical Context is restored.
 */


