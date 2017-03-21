//
//  RecordSoundsViewController.swift
//  pitchperfect
//
//  Created by seemant sagar on 3/18/17.
//  Copyright © 2017 seemant sagar. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate
{

    var audioRecorder: AVAudioRecorder!
    
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
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        recordinglabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingbutton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
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
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
    {
        print("recording is finished")
    }
}
