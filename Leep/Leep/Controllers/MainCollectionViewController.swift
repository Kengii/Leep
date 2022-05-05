//
//  MainCollectionViewController.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {

    private var image: [ImageDetail] = []
    private let dataFetcherService: DataFetcherServiceProtocol = DataFetcherService()

    private var imageView1: UIImageView?
    private var imageView2: UIImageView?
    private var imageView3: UIImageView?
    private var imageView4: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataFetcherService.fetchLocalCountry { [weak self] (image) in
            self?.image = image ?? []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell

        let image = image[indexPath.row]
        cell.image = image
        cell.viewImage.layer.cornerRadius = 5

        CreatingImageForCell.shared.createImage(imageView: &imageView1, imageView1: &imageView2, imageView2: &imageView3, imageView3: &imageView4, cell: cell, image: cell.image, indexPath: indexPath)
        
        Animations.shared.animateImage(imageView: imageView1, imageView1: imageView2, imageView2: imageView3, imageView3: imageView4, image: image, factorReview: 1, label: nil)
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image1 = image[indexPath.row]
        performSegue(withIdentifier: "ShowDetail", sender: image1)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailVC,
            let image = sender as? ImageDetail {
            detailVC.image = image
            
        }
    }
}

    // MARK: - Extensions

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = UIScreen.main.bounds.height / 2.45
        let widht = UIScreen.main.bounds.width / 2.14

        return CGSize(width: widht, height: height)
    }
}
