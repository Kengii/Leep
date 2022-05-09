//
//  File.swift
//  Leep
//
//  Created by Владимир Данилович on 5.05.22.
//

import UIKit
import ReplayKit

final class Recording {

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
}

