//
//  PianoOctaveView.swift
//  FastMidi
//
//  Created by Girum Ibssa on 1/29/17.
//  Copyright © 2017 Girum Ibssa. All rights reserved.
//

import UIKit

@IBDesignable
class PianoOctaveView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        
        UIColor.gray.set()
        
        let c = CGRect(x: Keys.width * 0, y: 0, width: Keys.width, height: Keys.height)
        let d = CGRect(x: Keys.width * 1, y: 0, width: Keys.width, height: Keys.height)
        let e = CGRect(x: Keys.width * 2, y: 0, width: Keys.width, height: Keys.height)
        let f = CGRect(x: Keys.width * 3, y: 0, width: Keys.width, height: Keys.height)
        let g = CGRect(x: Keys.width * 4, y: 0, width: Keys.width, height: Keys.height)
        let a = CGRect(x: Keys.width * 5, y: 0, width: Keys.width, height: Keys.height)
        let b = CGRect(x: Keys.width * 6, y: 0, width: Keys.width, height: Keys.height)
        
        let cSharp = CGRect(x: Keys.blackOffset + Keys.width * 0, y: 0, width: Keys.blackWidth, height: Keys.blackHeight)
        let dSharp = CGRect(x: Keys.blackOffset + Keys.width * 1 , y: 0, width: Keys.blackWidth, height: Keys.blackHeight)
        let fSharp = CGRect(x: Keys.blackOffset + Keys.width * 3, y: 0, width: Keys.blackWidth, height: Keys.blackHeight)
        let aFlat = CGRect(x: Keys.blackOffset + Keys.width * 4, y: 0, width: Keys.blackWidth, height: Keys.blackHeight)
        let bFlat = CGRect(x: Keys.blackOffset + Keys.width * 5, y: 0, width: Keys.blackWidth, height: Keys.blackHeight)
        
        
        UIBezierPath(rect: c).stroke()
        UIBezierPath(rect: d).stroke()
        UIBezierPath(rect: e).stroke()
        UIBezierPath(rect: f).stroke()
        UIBezierPath(rect: g).stroke()
        UIBezierPath(rect: a).stroke()
        UIBezierPath(rect: b).stroke()
        
        UIBezierPath(rect: cSharp).stroke()
        UIBezierPath(rect: dSharp).stroke()
        UIBezierPath(rect: fSharp).stroke()
        UIBezierPath(rect: aFlat).stroke()
        UIBezierPath(rect: bFlat).stroke()
        
        UIColor.black.setFill()
        UIRectFill(cSharp)
        UIRectFill(dSharp)
        UIRectFill(fSharp)
        UIRectFill(aFlat)
        UIRectFill(bFlat)
        
    }

}


struct Keys {
    static let width = 20
    static let height = 100
    
    static let blackWidth = 14
    static let blackHeight = 60
    static let blackOffset = 13
}
