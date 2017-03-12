//
//  ViewController.swift
//  FastMidi
//
//  Created by Girum Ibssa on 1/21/17.
//  Copyright © 2017 Girum Ibssa. All rights reserved.
//

import UIKit
import CoreMIDI
import AudioToolbox



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
        
        // Load "mysoundname.wav"
        var mySound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: "Tennis Serve", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
        }
        
        func MyMIDIReadProc(pktlist: UnsafePointer<MIDIPacketList>, refCon: UnsafeMutableRawPointer?) {
            let packet: MIDIPacket = pktlist.pointee.packet
            let midiCommand = packet.data.0 >> 4
            
            // is it a note-on
            if (midiCommand == 0x09) {
                let note = packet.data.1 & 0x7F
                let velocity = packet.data.2 & 0x7F
                
                print("got MIDI note: \(note) at velocity \(velocity)")
                
                // Play
                AudioServicesPlaySystemSound(mySound)
            }
        }
        
        var outPort = MIDIPortRef()
        MIDIInputPortCreateWithBlock(midiClient, "My MIDI port" as CFString, &outPort, MyMIDIReadProc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

