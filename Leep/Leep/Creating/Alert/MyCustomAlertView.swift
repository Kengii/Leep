//
//  MyCustomAlertView.swift
//  Leep
//
//  Created by Владимир Данилович on 5.05.22.
//

import UIKit
import SwiftEntryKit

final class MyCustomAlertView: UIView {

    private var imageView: UIImageView!
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let actionButton = UIButton()

    private var content: EKProperty.TextFieldContent
    private let textField = UITextField()

    public var text: String {
        set {
            textField.text = newValue
        }
        get {
            return textField.text ?? ""
        }
    }

    private let message: EKPopUpMessage

    init(with message: EKPopUpMessage, with content: EKProperty.TextFieldContent) {
        self.message = message
        self.content = content
        super.init(frame: UIScreen.main.bounds)

        setupElements()
        setupConstraints()
        setupTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButtonPressed() {
        text = textField.text ?? ""
        print(text)
        message.action()
    }
}

extension MyCustomAlertView {
    private func setupElements() {
        titleLabel.content = self.message.title
        descriptionLabel.content = self.message.description
        actionButton.buttonContent = self.message.button

        actionButton.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)

        guard let themeImage = message.themeImage else { return }
        imageView = UIImageView()
        imageView.imageContent = themeImage.image
    }

    private func setupTextField() {
        textField.textFieldContent = content
        textField.delegate = content.delegate
        textField.backgroundColor = .lightGray
    }
}

extension MyCustomAlertView {
    private func setupConstraints() {
        addSubview(imageView)
        imageView.layoutToSuperview(.centerX)
        imageView.layoutToSuperview(.top, offset: 20)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
            ])

        addSubview(descriptionLabel)
        descriptionLabel.layoutToSuperview(axis: .horizontally, offset: 10)
        descriptionLabel.layout(.top, to: .bottom, of: titleLabel, offset: 16)
        descriptionLabel.forceContentWrap(.vertically)

        addSubview(textField)
        textField.layout(.top, to: .bottom, of: descriptionLabel, offset: 10)
        textField.layoutToSuperview(.centerX)

        addSubview(actionButton)
        let height: CGFloat = 45
        actionButton.set(.height, of: height)
        actionButton.layout(.top, to: .bottom, of: textField, offset: 10)
        actionButton.layoutToSuperview(.bottom, offset: -10)
        actionButton.layoutToSuperview(.centerX)

        let buttonAttributes = message.button
        actionButton.buttonContent = buttonAttributes
        actionButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        actionButton.layer.cornerRadius = height * 0.5
    }
}
