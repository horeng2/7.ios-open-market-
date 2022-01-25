//
//  CollectionViewCell.swift
//  OpenMarket
//
//  Created by 서녕 on 2022/01/19.
//

import UIKit

class GridCell: UICollectionViewCell {
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameLable: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discountedPriceLabel: UILabel!
    @IBOutlet private weak var stockLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemGray2.cgColor
    }
    
    func updateGridCell(productData: ProductPreview) {
        loadImage(url: productData.thumbnail) { image in
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        }
        
        let commaPrice = "\(productData.price)".insertCommaInThousands()
        let commaDiscountedPrice = "\(productData.discountedPrice)".insertCommaInThousands()
        nameLable.text = productData.name
        priceLabel.text = "\(productData.currency) \(commaPrice) "
        discountedPriceLabel.text = "\(productData.currency) \(commaDiscountedPrice)"
        discountedPriceLabel.textColor = .systemGray
        
        if productData.stock == 0 {
            stockLabel.text = "품절"
            stockLabel.textColor = .systemYellow
        } else {
            stockLabel.text = "잔여수량: \(productData.stock)"
            stockLabel.textColor = .systemGray
        }
    }
    
    func loadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: url) else {
            return
        }
        let thumbnailCache = NSCache<NSString, UIImage>()
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            if let thumbnailCacheImage = thumbnailCache.object(forKey: url as NSString) {
                completion(thumbnailCacheImage)
            } else {
                let image = UIImage(data: data)
                thumbnailCache.setObject(image ?? UIImage(), forKey: url as NSString)
                completion(image)
            }
        }
        task.resume()
    }
    
    
}
