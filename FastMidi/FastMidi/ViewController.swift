//
//  ViewController.swift
//  FastMidi
//
//  Created by Girum Ibssa on 1/21/17.
//  Copyright © 2017 Girum Ibssa. All rights reserved.
//

import UIKit
import CoreMIDI



var midiClient = MIDIClientRef()


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pianoOctaveView: PianoOctaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func MyMIDINotifyBlock(midiNotification: UnsafePointer<MIDINotification>) {
            print("\ngot a MIDINotification!", midiNotification.pointee.messageID)
            label.text! = "got a MIDI notification!"
        }
        
        let notifyBlock = MyMIDINotifyBlock
        
        let status = MIDIClientCreateWithBlock("io.girum.MyMIDIClient" as CFString, &midiClient, notifyBlock)
        
        if status == noErr {
            print("created client \(midiClient)")
        } else {
            print("error creating client : \(status)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

