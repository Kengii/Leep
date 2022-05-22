//
//  MainCollectionViewController.swift
//  Leep
//
//  Created by Владимир Данилович on 4.05.22.
//

import UIKit

final class MainCollectionViewController: UICollectionViewController {

    private var image: [ImageDetail] = []
    private let dataFetcherService: DataFetcherServiceProtocol = DataFetcherService()

    override func viewDidLoad() {
        super.viewDidLoad()
        if LandscapeManager.shared.isFirstLaunch {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let popupViewController = storyboard.instantiateViewController(withIdentifier: "Onboarding")
    popupViewController.modalPresentationStyle = .automatic
            self.present(popupViewController, animated: true, completion: nil)
            LandscapeManager.shared.isFirstLaunch = true
        } else {
            print("Hello")
        }
        dataFetcherService.fetchLocalCountry { [weak self] (image) in
            self?.image = image ?? []
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
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
        
        cell.image = image[indexPath.row]
        cell.createImage()
        cell.animateImage()
        cell.borderAndShadowCell()

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
