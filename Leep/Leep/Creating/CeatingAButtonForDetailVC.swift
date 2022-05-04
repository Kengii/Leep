//
//  CeatingAButtonForDetailVC.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class CreatingAButtonForDetailVC {

    static let shared = CreatingAButtonForDetailVC()

    private init() { }

    func createButton(viewIm: UIView, image: ImageDetail?, selector: Selector) {

        let width = UIScreen.main.bounds.width
        print(width)
        let heght = UIScreen.main.bounds.height
        print(heght)
        guard let image = image else { return }

        let myButton1 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX1 ?? 1),
            y: heght * (image.imageFactor?.factorY1 ?? 1),
            width: width * (image.imageFactor?.factorW1 ?? 1),
            height: heght * (image.imageFactor?.factorH1 ?? 1)))
        myButton1.addTarget(self, action: selector, for: .touchUpInside)
        viewIm.addSubview(myButton1)
        myButton1.tag = 0

        let myButton2 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX2 ?? 1),
            y: heght * (image.imageFactor?.factorY2 ?? 1),
            width: width * (image.imageFactor?.factorW2 ?? 1),
            height: heght * (image.imageFactor?.factorH2 ?? 1)))
        myButton2.addTarget(self, action: selector, for: .touchUpInside)
        viewIm.addSubview(myButton2)
        myButton2.tag = 1

        let myButton3 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX3 ?? 1),
            y: heght * (image.imageFactor?.factorY3 ?? 1),
            width: width * (image.imageFactor?.factorW3 ?? 1),
            height: heght * (image.imageFactor?.factorH3 ?? 1)))
        myButton3.addTarget(self, action: selector, for: .touchUpInside)
        viewIm.addSubview(myButton3)
        myButton3.tag = 2

        let myButton4 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX4 ?? 1),
            y: heght * (image.imageFactor?.factorY4 ?? 1),
            width: width * (image.imageFactor?.factorW1 ?? 1),
            height: heght * (image.imageFactor?.factorH4 ?? 1)))
        myButton4.addTarget(self, action: selector, for: .touchUpInside)
        viewIm.addSubview(myButton4)
        myButton4.tag = 3
    }
}

