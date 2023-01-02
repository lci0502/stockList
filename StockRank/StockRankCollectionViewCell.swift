//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by DALAMZ_CHAEIN on 2022/12/20.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // uicomponent 연결
    // uicomponent에 데이터를 업데이트 하는 코드
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        
        companyPriceLabel.text = "\(convertToCurruncyFormat(price: stock.price)) 원"
        
        let _: UIColor
//        if stock.diff > 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
        
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        
        
        diffLabel.text = "\(stock.diff)%"
        
        
    }
    
    func convertToCurruncyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    

}

