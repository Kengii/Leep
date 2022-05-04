//
//  Animations.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class Animations {
    static let shared = Animations()

    private init() { }

    func animateImage(imageView: UIImageView?, imageView1: UIImageView?, imageView2: UIImageView?, imageView3: UIImageView?, image: ImageDetail?, factorReview: CGFloat, label: UILabel?) {

        guard let animations = image else { return }

        UIView.animate(withDuration: 6, delay: 0, options: [.repeat], animations: {
                imageView?.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0) * factorReview
                imageView1?.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0) * factorReview
                imageView2?.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0) * factorReview
                imageView3?.frame.size.height -= CGFloat(animations.imageAnimation?.imageHeight1Anim ?? 0.0) * factorReview
                imageView?.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth1Anim ?? 0) * factorReview
                imageView1?.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth2Anim ?? 0) * factorReview
                imageView2?.frame.size.width += CGFloat(animations.imageAnimation?.imageWidth3Anim ?? 0) * factorReview

                imageView?.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha1Anim ?? 0) * factorReview
                imageView1?.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha2Anim ?? 0) * factorReview
                imageView2?.frame.origin.x += CGFloat(animations.imageAnimation?.imageAlpha3Anim ?? 0) * factorReview

                imageView?.transform = CGAffineTransform(scaleX: CGFloat(animations.imageAnimation?.imageScale1 ?? 1), y: CGFloat(animations.imageAnimation?.imageScale1 ?? 1))

                imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(animations.imageAnimation?.imageScale2 ?? 0))

                label?.alpha += 1
            })
    }
}
