//
//  CreatingImageForCell.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class CreatingImageForCell {

    static let shared = CreatingImageForCell()

    private init() { }

    var isStarted = 1

    func createImage(imageView: inout UIImageView?, imageView1: inout UIImageView?, imageView2: inout UIImageView?, imageView3: inout UIImageView?, cell: CustomCollectionViewCell, image: [ImageDetail?], indexPath: IndexPath) {

        guard let image = image[indexPath.row] else { return }

        if isStarted == 1 {

            let height = UIScreen.main.bounds.height / 2.45
            let width = UIScreen.main.bounds.width / 2.14

            cell.viewImage.frame.size.height = height
            cell.viewImage.frame.size.width = width
            print(cell.viewImage.frame.height)

            imageView = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX1 ?? 1),
                y: height * (image.imageFactor?.factorY1 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW1 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH1 ?? 1)))

            imageView1 = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX2 ?? 1),
                y: height * (image.imageFactor?.factorY2 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW2 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH2 ?? 1)))

            imageView2 = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX3 ?? 1),
                y: height * (image.imageFactor?.factorY3 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW3 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH3 ?? 1)))

            imageView3 = UIImageView(frame: CGRect(x: width * (image.imageFactor?.factorX4 ?? 1),
                y: height * (image.imageFactor?.factorY4 ?? 1),
                width: width * (image.imageFactorForCell?.imageFactorForCellW4 ?? 1),
                height: height * (image.imageFactorForCell?.imageFactorForCellH4 ?? 1)))

            Animations.shared.animateImage(imageView: imageView, imageView1: imageView1, imageView2: imageView2, imageView3: imageView3, image: image, factorReview: 1, label: nil)

            imageView?.image = UIImage(named: image.imageNames?.imageNamed1 ?? "emptyImage")
            imageView1?.image = UIImage(named: image.imageNames?.imageNamed2 ?? "emptyImage")
            imageView2?.image = UIImage(named: image.imageNames?.imageNamed3 ?? "emptyImage")
            imageView3?.image = UIImage(named: image.imageNames?.imageNamed4 ?? "emptyImage")

            cell.viewImage.addSubview(imageView ?? cell.viewImage)
            cell.viewImage.addSubview(imageView1 ?? cell.viewImage)
            cell.viewImage.addSubview(imageView2 ?? cell.viewImage)
            cell.viewImage.addSubview(imageView3 ?? cell.viewImage)

            isStarted += 1
        }
    }
}

