//
//  FirstVC.swift
//  Leep
//
//  Created by Владимир Данилович on 6.05.22.
//

import UIKit
import Onboarder
import SwiftUI

class OnboardingVC: UIViewController {

    private let pages: [OBPage] = [
        OBPage(color: .white, imageName: "on", label: ("Добро пожаловать", "Спасибо что выбрали нас! Пройдите обучение!")),
        OBPage(color: .white, imageName: "on1", label: ("Главный экран", "Здесь вы можете выбрать понравившуюся вам анимацию")),
        OBPage(color: .white, imageName: "on2", label: ("Работа с изображениями", "Здесь вы можете добавть свои фотографии для выбранной анимации")), OBPage(color: .white, imageName: "on3", label: ("Добавление текста", "Нажав на букву в верхнем правом углу, вы сможете добавить текст")), OBPage(color: .white, imageName: "on4", label: ("Рисование", "Нажав на ручку в верхнем правом углу вы сможете рисовать"))
    ]

    @IBOutlet weak private var onboView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // With custom configuration
        let config = OBConfiguration(isSkippable: true, textContentBackgroundColor: .green)

        let onboarding = UIOnboardingView(frame: .zero, pages: pages, configuration: config, dismiss: dismiisOnboarding)

        // Add onboarding view to viewController
        view.addSubview(onboarding)
        // Add onboarding view constrints
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        onboarding.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        onboarding.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        onboarding.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        onboarding.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

    private func dismiisOnboarding() {
        dismiss(animated: true)
    }
}
