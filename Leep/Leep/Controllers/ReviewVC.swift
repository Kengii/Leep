//
//  ReviewVC.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit
import ReplayKit

final class ReviewVC: UIViewController, RPPreviewViewControllerDelegate {

    var image: ImageDetail?
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    var image4: UIImage?
    var image5: UIImage?

    private var imageView: UIImageView?
    private var imageView1: UIImageView?
    private var imageView2: UIImageView?
    private var imageView3: UIImageView?
    private var imageView4: UIImageView?

    private var timer = Timer()
    private var time: Float = 0

    var textsLabel: String?
    var x: CGFloat?
    var y: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var label: UILabel?

    @IBOutlet weak private var viewImage: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Recording.shared.startRecording { [weak self] in
            print("start")
            self?.timer = Timer.scheduledTimer(timeInterval: 6, target: self as Any, selector: #selector(self?.updateProgressTime), userInfo: nil, repeats: false)
            Animations.shared.animateImage(imageView: self?.imageView, imageView1: self?.imageView1, imageView2: self?.imageView2, imageView3: self?.imageView3, image: self?.image, factorReview: 2, label: self?.label)
            UIView.animate(withDuration: 6, delay: 0.2, options: .curveEaseIn) {
                self?.label?.alpha += 1
            }
        }
        createImage()
        createLabel()
        viewImage.bringSubviewToFront(imageView4 ?? viewImage)
    }

    // MARK: - Private

    private func createLabel() {

        label = UILabel(frame: CGRect(x: x ?? 1, y: y ?? 1, width: width ?? 1, height: height ?? 1))
        label?.text = textsLabel
        label?.textColor = .black
        label?.font = label?.font.withSize(35)
        label?.textAlignment = .center
        label?.shadowColor = .darkGray
        label?.shadowOffset.height = 3
        label?.shadowOffset.width = 2
        viewImage.bringSubviewToFront(label ?? viewImage)
        viewImage.addSubview(label ?? viewImage)
        label?.alpha = 0
    }

    @objc private func updateProgressTime() {
        stopRecording()

    }

    private func stopRecording() {
        if RPScreenRecorder.shared().isAvailable == true {
            RPScreenRecorder.shared().stopRecording { [weak self] (previewController, error) in
                if previewController != nil {
                    _ = UIAlertController(title: "Recording", message: "Do you wish to discard or view your gameplay recording?", preferredStyle: .alert)

                    _ = UIAlertAction(title: "Discard", style: .default) { (action: UIAlertAction) in
                        RPScreenRecorder.shared().discardRecording {
                            print("Good")
                        }
                    }

                    previewController?.previewControllerDelegate = self
                    previewController?.modalPresentationStyle = .overFullScreen
                    self?.present(previewController!, animated: true, completion: nil)

                }
            }
        }
    }

    // MARK: RPPreviewViewControllerDelegate

    @objc func previewControllerDidFinish(_ previewController: RPPreviewViewController) {

        previewController.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)

    }

    private func createImage() {
        guard let image = image else { return }

        let width = UIScreen.main.bounds.width

        let height = UIScreen.main.bounds.height

        imageView = UIImageView(frame: CGRect(x: width * (image.imageFactorForCell?.imageFactorForCellX1 ?? 1),
            y: height * (image.imageFactor?.factorY1 ?? 1),
            width: width * (image.imageFactorForCell?.imageFactorForCellW1 ?? 1),
            height: height * (image.imageFactorForCell?.imageFactorForCellH1 ?? 1)))
        print(imageView?.frame.origin.y)

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

        imageView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView4?.image = image5
        viewImage.addSubview(imageView4 ?? viewImage)

        imageView?.image = image1
        viewImage.addSubview(imageView ?? viewImage)

        imageView1?.image = image2
        viewImage.addSubview(imageView1 ?? viewImage)

        imageView2?.image = image3
        viewImage.addSubview(imageView2 ?? viewImage)

        imageView3?.image = image4
        viewImage.addSubview(imageView3 ?? viewImage)
    }
}
