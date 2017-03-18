//
//  ViewController.swift
//  pitchperfect
//
//  Created by seemant sagar on 3/18/17.
//  Copyright © 2017 seemant sagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordinglabel: UILabel!
    @IBOutlet weak var recordingbutton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordaudio(_ sender: AnyObject)
    {
        recordinglabel.text = "recording in progress"
        stopRecordingButton.isEnabled = true
        recordingbutton.isEnabled = false
        
    }
    @IBAction func stoprecording(_ sender: AnyObject)
    {
        recordingbutton.isEnabled = true
        stopRecordingButton.isEnabled = false
        recordinglabel.text = "Tap to Record"
        
        
    }

}
