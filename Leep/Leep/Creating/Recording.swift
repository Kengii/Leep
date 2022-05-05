//
//  File.swift
//  Leep
//
//  Created by Владимир Данилович on 5.05.22.
//

import UIKit
import ReplayKit

class Recording {

    static let shared = Recording()

    private init() { }

    func startRecording(complition: @escaping () -> ()) {
        if RPScreenRecorder.shared().isAvailable {
            RPScreenRecorder.shared().startRecording(handler: { error in
                if error == nil { // Recording has started
                    print("start")
                    complition()
                } else {
                    print("error")
                }
            })
        }
    }
    
    func stopRecording(priviewCntrl: RPPreviewViewController, complition: @escaping () -> ()) {
        if RPScreenRecorder.shared().isAvailable == true {
            RPScreenRecorder.shared().stopRecording { [weak self] (priviewCntrl, error) in
                if priviewCntrl != nil {
                    _ = UIAlertController(title: "Recording", message: "Do you wish to discard or view your gameplay recording?", preferredStyle: .alert)

                    _ = UIAlertAction(title: "Discard", style: .default) { (action: UIAlertAction) in
                        RPScreenRecorder.shared().discardRecording {
                            print("Good")
                        }
                    }

//                    priviewCntrl?.previewControllerDelegate = self as! RPPreviewViewControllerDelegate
                    priviewCntrl?.modalPresentationStyle = .overFullScreen
                    
                    complition()

                }
            }
        }
    }
}

