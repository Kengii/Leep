//
//  CreateAlert.swift
//  Leep
//
//  Created by Владимир Данилович on 5.05.22.
//

import UIKit
import SwiftEntryKit

class CreateAlert {

    static let shared = CreateAlert()

    private init() { }
    var text: MyCustomAlertView?
    
    func createAlert(complition: @escaping (String)->()) {
        
        SwiftEntryKit.display(entry: MyCustomAlertView(with: setupMessege(), with: setupTextField()), using: setupAAttributes())
        complition(text?.text ?? "")
    }
    
    private func setupAAttributes() -> EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.displayDuration = .infinity
        attributes.screenBackground = .color(color: .init(light: UIColor(white: 100.0/255.0, alpha: 0.3), dark: UIColor(white: 50.0/255.0, alpha: 0.3)))
        attributes.shadow = .active(
            with: .init(
                color: .black,
                opacity: 0.3,
                radius: 8
            )
        )
        
        attributes.entryBackground = .color(color: .standardBackground)
        attributes.roundCorners = .all(radius: 25)
        
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(
            swipeable: true,
            pullbackAnimation: .jolt
        )
        
        attributes.entranceAnimation = .init(
            translate: .init(
                duration: 0.7,
                spring: .init(damping: 1, initialVelocity: 0)
            ),
            scale: .init(
                from: 1.05,
                to: 1,
                duration: 0.4,
                spring: .init(damping: 1, initialVelocity: 0)
            )
        )
        
        attributes.exitAnimation = .init(
            translate: .init(duration: 0.2)
        )
        attributes.popBehavior = .animated(
            animation: .init(
                translate: .init(duration: 0.2)
            )
        )
        
        attributes.positionConstraints.verticalOffset = 10
        attributes.statusBar = .dark
        return attributes
    }
    
    private func setupMessege() -> EKPopUpMessage {
        
        let image = UIImage(named: "LaunchIcon")!
        let title = "Add text!"
        let description =
        """
        here you can add the text
        that will be displayed
        on the screen 
        """
        
        let themeImage = EKPopUpMessage.ThemeImage(image: EKProperty.ImageContent(image: image, size: CGSize(width: 60, height: 60), contentMode: .scaleAspectFit))
        
        let titleLabel  = EKProperty.LabelContent(text: title, style: .init(font: UIFont.systemFont(ofSize: 24), color: .black, alignment: .center ))
        let discriptionLabel  = EKProperty.LabelContent(text: description, style: .init(font: UIFont.systemFont(ofSize: 24), color: .black, alignment: .center ))
        let button = EKProperty.ButtonContent(label: .init(text: "OK", style: .init(font: UIFont.systemFont(ofSize: 24), color: .black)), backgroundColor: .init(UIColor.systemOrange), highlightedBackgroundColor: .clear)
       
        
        let messege = EKPopUpMessage(themeImage: themeImage, title: titleLabel, description: discriptionLabel, button: button) {
            SwiftEntryKit.dismiss()
        }
        return messege
    }
    private func setupTextField() -> EKProperty.TextFieldContent {
        
        let title = "Add text!"
        let titleLabel  = EKProperty.LabelContent(text: title, style: .init(font: UIFont.systemFont(ofSize: 24), color: .black, alignment: .center ))
        let textFieldContent = EKProperty.TextFieldContent(placeholder: titleLabel, textStyle: .init(font: UIFont.systemFont(ofSize: 24), color: .black))
        return textFieldContent
    }
}


