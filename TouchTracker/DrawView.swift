//
//  DrawView.swift
//  TouchTracker
//
//  Created by Dan Patey on 7/3/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var currentLine: Line?
    var finishedLines = [Line]()
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = 10
        path.lineCapStyle = CGLineCap.Round
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        // Draw finished lines in black
        UIColor.blackColor().setStroke()
        for line in finishedLines {
            strokeLine(line)
        }
    
        if let line = currentLine {
            // If there is a line currently being drawn, do it in red
            UIColor.redColor().setStroke()
            strokeLine(line)
        }
    }
}