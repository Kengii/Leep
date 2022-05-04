//
//  CustomCollectionViewCell.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    var isStarted = 1
    var image: ImageDetail?

    @IBOutlet weak var viewImage: UIView!

    func createImage() {

        if isStarted == 1 {

            let height = UIScreen.main.bounds.height / 2.45
            let width = UIScreen.main.bounds.width / 2.14

            viewImage.frame.size.height = height
            viewImage.frame.size.width = width
            print(viewImage.frame.height)


            guard let image = image else { return }

            let imageView = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX1 ?? 1),
                y: height * (image.imageFactor?.factorY1 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW1 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH1 ?? 1)))

            let imageView1 = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX2 ?? 1),
                y: height * (image.imageFactor?.factorY2 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW2 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH2 ?? 1)))

            let imageView2 = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX3 ?? 1),
                y: height * (image.imageFactor?.factorY3 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW3 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH3 ?? 1)))

            let imageView3 = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX4 ?? 1),
                y: height * (image.imageFactor?.factorY4 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW4 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH4 ?? 1)))

            Animations.shared.animateImage(imageView: imageView, imageView1: imageView1, imageView2: imageView2, imageView3: imageView3, image: image, factorReview: 1, label: nil)

            imageView.image = UIImage(named: image.imageNames?.imageNamed1 ?? "")
            imageView1.image = UIImage(named: image.imageNames?.imageNamed2 ?? "")
            imageView2.image = UIImage(named: image.imageNames?.imageNamed3 ?? "")
            imageView3.image = UIImage(named: image.imageNames?.imageNamed4 ?? "")

            viewImage.addSubview(imageView)
            viewImage.addSubview(imageView1)
            viewImage.addSubview(imageView2)
            viewImage.addSubview(imageView3)

            isStarted += 1
        }
    }
}
