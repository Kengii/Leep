//
//  CustomCollectionViewCell.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    var image: ImageDetail?

    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak private var imageView1: UIImageView!
    @IBOutlet weak private var imageView2: UIImageView!
    @IBOutlet weak private var imageView3: UIImageView!
    @IBOutlet weak private var imageView4: UIImageView!

    func createImage() {

        let height = UIScreen.main.bounds.height / 2.45
        let width = UIScreen.main.bounds.width / 2.14
        
            viewImage.frame.size.height = height
            viewImage.frame.size.width = width

        guard let image = image else { return }

        imageView1.frame.size.height = height * (image.imageFactorForCell?.imageFactorForCellH1 ?? 1)
        imageView1.frame.size.width = width * (image.imageFactorForCell?.imageFactorForCellW1 ?? 1)
        imageView1.frame.origin.x = width * (image.imageFactorForCell?.imageFactorForCellX1 ?? 1)
        imageView1.frame.origin.y = height * (image.imageFactor?.factorY1 ?? 1)

        imageView2.frame.size.height = height * (image.imageFactorForCell?.imageFactorForCellH2 ?? 1)
        imageView2.frame.size.width = width * (image.imageFactorForCell?.imageFactorForCellW2 ?? 1)
        imageView2.frame.origin.x = width * (image.imageFactorForCell?.imageFactorForCellX2 ?? 1)
        imageView2.frame.origin.y = height * (image.imageFactor?.factorY2 ?? 1)

        imageView3.frame.size.height = height * (image.imageFactorForCell?.imageFactorForCellH3 ?? 1)
        imageView3.frame.size.width = width * (image.imageFactorForCell?.imageFactorForCellW3 ?? 1)
        imageView3.frame.origin.x = width * (image.imageFactorForCell?.imageFactorForCellX3 ?? 1)
        imageView3.frame.origin.y = height * (image.imageFactor?.factorY3 ?? 1)

        imageView4.frame.size.height = height * (image.imageFactorForCell?.imageFactorForCellH4 ?? 1)
        imageView4.frame.size.width = width * (image.imageFactorForCell?.imageFactorForCellW4 ?? 1)
        imageView4.frame.origin.x = width * (image.imageFactor?.factorX4 ?? 1)
        imageView4.frame.origin.y = height * (image.imageFactor?.factorY4 ?? 1)

        imageView1.image = UIImage(named: image.imageNames?.imageNamed1 ?? "")
        imageView2.image = UIImage(named: image.imageNames?.imageNamed2 ?? "")
        imageView3.image = UIImage(named: image.imageNames?.imageNamed3 ?? "")
        imageView4.image = UIImage(named: image.imageNames?.imageNamed4 ?? "")
    }

    func animateImage() {

        guard let animations = image else { return }

        UIView.animate(withDuration: 6, delay: 0, options: [.repeat], animations: {
                self.imageView1.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0)
                self.imageView2.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0)
                self.imageView3.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0)
                self.imageView4.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0)
                self.imageView1.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth1Anim ?? 0)
                self.imageView2.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth2Anim ?? 0)
                self.imageView3.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth3Anim ?? 0)

                self.imageView1.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha1Anim ?? 0)
                self.imageView2.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha2Anim ?? 0)
                self.imageView3.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha3Anim ?? 0)

                self.imageView1.transform = CGAffineTransform(scaleX: CGFloat(animations.imageAnimation?.imageScale1 ?? 1), y: CGFloat(animations.imageAnimation?.imageScale1 ?? 1))

                self.imageView1.transform = CGAffineTransform(rotationAngle: CGFloat(animations.imageAnimation?.imageScale2 ?? 0))

                self.imageView1.layer.transform = CATransform3DMakeRotation(CGFloat(animations.imageAnimation?.angel ?? 0), 0, CGFloat(animations.imageAnimation?.imageScale3 ?? 0), 0)
            })
    }
    
    func borderAndShadowCell() {
        viewImage.layer.borderWidth = 0.5
        viewImage.layer.borderColor = UIColor.red.cgColor
        viewImage.clipsToBounds = true
        viewImage.layer.shadowOpacity = 0.5
        viewImage.layer.shadowOffset.width = 5
        viewImage.layer.shadowOffset.height = 5
        viewImage.layer.shadowColor = UIColor.black.cgColor
        viewImage.layer.cornerRadius = 30
    }
}
