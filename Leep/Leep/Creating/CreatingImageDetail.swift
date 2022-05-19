//
//  CreatingImageDetail.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

final class CreateDetailImage {

    static let shared = CreateDetailImage()

    private init() { }

    func createImage(imageView: inout UIImageView?, imageView1: inout UIImageView?, imageView2: inout UIImageView?, imageView3: inout UIImageView?, viewIm: UIView, image: ImageDetail?) {

        let width = UIScreen.main.bounds.width

        let heght = UIScreen.main.bounds.height

        guard let image = image else { return }

        imageView = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX1 ?? 1),
            y: heght * (image.imageFactor?.factorY1 ?? 1),
            width: width * (image.imageFactor?.factorW1 ?? 1),
            height: heght * (image.imageFactor?.factorH1 ?? 1)))

        imageView?.image = UIImage(named: "emptyImage")
        viewIm.addSubview(imageView ?? viewIm)

        imageView1 = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX2 ?? 1),
            y: heght * (image.imageFactor?.factorY2 ?? 1),
            width: width * (image.imageFactor?.factorW2 ?? 1),
            height: heght * (image.imageFactor?.factorH2 ?? 1)))

        imageView1?.image = UIImage(named: "emptyImage")
        viewIm.addSubview(imageView1 ?? viewIm)

        imageView2 = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX3 ?? 1),
            y: heght * (image.imageFactor?.factorY3 ?? 1),
            width: width * (image.imageFactor?.factorW3 ?? 1),
            height: heght * (image.imageFactor?.factorH3 ?? 1)))

        imageView2?.image = UIImage(named: "emptyImage")
        viewIm.addSubview(imageView2 ?? viewIm)

        imageView3 = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX4 ?? 1),
            y: heght * (image.imageFactor?.factorY4 ?? 1),
            width: width * (image.imageFactor?.factorW4 ?? 1),
            height: heght * (image.imageFactor?.factorH4 ?? 1)))

        imageView3?.image = UIImage(named: "emptyImage")
        viewIm.addSubview(imageView3 ?? viewIm)
    }
}
