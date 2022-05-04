//
//  ModelImage.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import Foundation

struct ImageDetail: Decodable {

    var Id: String?
    var imageNames: ImageNames?
    var imageAnimation: ImageAnimation?
    var imageFactor: ImageFactor?
    var imageFactorForCell: ImageFactorForCell?
}

struct ImageNames: Decodable {
    var imageNamed1: String?
    var imageNamed2: String?
    var imageNamed3: String?
    var imageNamed4: String?
}

struct ImageAnimation: Decodable {
    var imageHeight1Anim: Float?
    var imageHeight2Anim: Float?
    var imageHeight3Anim: Float?
    var imageHeight4Anim: Float?
    var imagePosYAn: Float?
    var imageWidth1Anim: Float?
    var imageWidth2Anim: Float?
    var imageWidth3Anim: Float?
    var imageAlpha1Anim: Float?
    var imageAlpha2Anim: Float?
    var imageAlpha3Anim: Float?
    var imageScale1: Float?
    var imageScale2: Float?
}

struct ImageFactor: Decodable {
    var factorX1: Double?
    var factorX2: Double?
    var factorX3: Double?
    var factorX4: Double?
    var factorY1: Double?
    var factorY2: Double?
    var factorY3: Double?
    var factorY4: Double?
    var factorW1: Double?
    var factorW2: Double?
    var factorW3: Double?
    var factorW4: Double?
    var factorH1: Double?
    var factorH2: Double?
    var factorH3: Double?
    var factorH4: Double?
}

struct ImageFactorForCell: Decodable {
    var imageFactorForCellH1: Double?
    var imageFactorForCellH2: Double?
    var imageFactorForCellH3: Double?
    var imageFactorForCellH4: Double?
    var imageFactorForCellW1: Double?
    var imageFactorForCellW2: Double?
    var imageFactorForCellW3: Double?
    var imageFactorForCellW4: Double?
    var imageFactorForCellX1: Double?
    var imageFactorForCellX2: Double?
    var imageFactorForCellX3: Double?
}
