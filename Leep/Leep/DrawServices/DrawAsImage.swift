//
//  DrawAsImage.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import PhotosUI

final class DrawAsImage {
    static let shared = DrawAsImage()

    private init() { }

    func saveImage(drawView: Draw) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(drawView.bounds.size, false, UIScreen.main.scale)

        drawView.drawHierarchy(in: drawView.bounds, afterScreenUpdates: true)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
