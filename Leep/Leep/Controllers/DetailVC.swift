//
//  DetailVC.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class DetailVC: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var viewIm: UIView!
    @IBOutlet weak var myTextLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStackColorBtns: UIStackView!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    @IBOutlet weak var drawView: Draw!

    var image: ImageDetail?
    private var imageView: UIImageView?
    private var imageView1: UIImageView?
    private var imageView2: UIImageView?
    private var imageView3: UIImageView?
    private var buttonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        CreateDetailImage.shared.createImage(imageView: &imageView, imageView1: &imageView1, imageView2: &imageView2, imageView3: &imageView3, viewIm: viewIm, image: image)
        createButton()
    }

    // MARK: - @IBAction

    @IBAction func slideValueAction(_ sender: UISlider) {
        drawView.setStrokeWidth(width: mySlider.value)
    }

    @IBAction func clearBtn(_ sender: UIButton) {
        drawView.clear()
    }

    @IBAction func undoBtn(_ sender: UIButton) {
        drawView.undo()
    }

    @IBAction func colorBtns(_ sender: UIButton) {
        drawView.setStrokeColor(color: sender.backgroundColor ?? .black)
        mySlider.tintColor = sender.backgroundColor ?? .black
        mySlider.thumbTintColor = sender.backgroundColor ?? .black
    }


    @IBAction func drawAction(_ sender: UIBarButtonItem) {
        firstPlan()
        drawView.isHidden.toggle()
        myStackColorBtns.isHidden.toggle()
        undoBtn.isHidden.toggle()
        clearBtn.isHidden.toggle()
        mySlider.isHidden.toggle()
    }

    @IBAction func editTextAction(_ sender: Any) {
        firstPlan()
        myTextLabel.isHidden.toggle()
        let alertController = UIAlertController(title: "Add Text", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = "Enter Your Text"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            self.myTextLabel.text = firstTextField.text
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) -> Void in })

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }

    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }

    @IBAction func handleRotation(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

    // MARK: - Private

    private func firstPlan() {
        viewIm.bringSubviewToFront(myTextLabel)
        viewIm.bringSubviewToFront(drawView)
        viewIm.bringSubviewToFront(mySlider)
        viewIm.bringSubviewToFront(myStackColorBtns)
        viewIm.bringSubviewToFront(clearBtn)
        viewIm.bringSubviewToFront(undoBtn)
    }

    private func createButton() {

        let width = UIScreen.main.bounds.width
        print(width)
        let heght = UIScreen.main.bounds.height
        print(heght)
        guard let image = image else { return }

        let myButton1 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX1 ?? 1),
            y: heght * (image.imageFactor?.factorY1 ?? 1),
            width: width * (image.imageFactor?.factorW1 ?? 1),
            height: heght * (image.imageFactor?.factorH1 ?? 1)))
        myButton1.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        viewIm.addSubview(myButton1)
        myButton1.tag = 0

        let myButton2 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX2 ?? 1),
            y: heght * (image.imageFactor?.factorY2 ?? 1),
            width: width * (image.imageFactor?.factorW2 ?? 1),
            height: heght * (image.imageFactor?.factorH2 ?? 1)))
        myButton2.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        viewIm.addSubview(myButton2)
        myButton2.tag = 1

        let myButton3 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX3 ?? 1),
            y: heght * (image.imageFactor?.factorY3 ?? 1),
            width: width * (image.imageFactor?.factorW3 ?? 1),
            height: heght * (image.imageFactor?.factorH3 ?? 1)))
        myButton3.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        viewIm.addSubview(myButton3)
        myButton3.tag = 2

        let myButton4 = UIButton(frame: CGRect(x: width * (image.imageFactor?.factorX4 ?? 1),
            y: heght * (image.imageFactor?.factorY4 ?? 1),
            width: width * (image.imageFactor?.factorW1 ?? 1),
            height: heght * (image.imageFactor?.factorH4 ?? 1)))
        myButton4.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        viewIm.addSubview(myButton4)
        myButton4.tag = 3
    }


    @objc private func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0: buttonIndex = 0
        case 1: buttonIndex = 1
        case 2: buttonIndex = 2
        case 3: buttonIndex = 3
        default: break
        }
        let cameraIcon = UIImage(named: "camera")
        let photoIcon = UIImage(named: "photo")

        let actionSheet = UIAlertController(title: nil,
            message: nil,
            preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        camera.setValue(cameraIcon, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        photo.setValue(photoIcon, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)

        present(actionSheet, animated: true)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let detailVC = segue.destination as? ReviewVC {
            if image != nil && imageView?.image != nil || ((imageView1?.image) != nil) || ((imageView2?.image) != nil) || ((imageView3?.image) != nil) || myTextLabel != nil {
                detailVC.image = image
                detailVC.image1 = imageView?.image
                detailVC.image2 = imageView1?.image
                detailVC.image3 = imageView2?.image
                detailVC.image4 = imageView3?.image
                detailVC.textsLabel = myTextLabel.text
                detailVC.x = myTextLabel.frame.origin.x
                detailVC.y = myTextLabel.frame.origin.y
                detailVC.height = myTextLabel.frame.height
                detailVC.width = myTextLabel.frame.width
            }
            detailVC.image5 = DrawAsImage.shared.saveImage(drawView: drawView)
        }
    }
}

extension DetailVC: UIImagePickerControllerDelegate {
    func chooseImagePicker (source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        switch buttonIndex {
        case 0:
            let image = info[.editedImage] as? UIImage
            imageView?.image = image
            imageView?.contentMode = .scaleAspectFill
            imageView?.clipsToBounds = true
        case 1:
            let image1 = info[.editedImage] as? UIImage
            imageView1?.image = image1
            imageView1?.contentMode = .scaleAspectFill
            imageView1?.clipsToBounds = true
        case 2:
            let image2 = info[.editedImage] as? UIImage
            imageView2?.image = image2
            imageView2?.contentMode = .scaleAspectFill
            imageView2?.clipsToBounds = true
        case 3:
            let image3 = info[.editedImage] as? UIImage
            imageView3?.image = image3
            imageView3?.contentMode = .scaleAspectFill
            imageView3?.clipsToBounds = true
        default: break
        }
        dismiss(animated: true)
    }
}

extension DetailVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith shouldRecognizeSimultaneouslyWithGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

