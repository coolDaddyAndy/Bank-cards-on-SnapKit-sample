//
//  AccountViewInfo.swift
//  Bank-cards-on-SnapKit-sample
//
//  Created by Andrei Sushkou on 14.02.23.
//

import UIKit

struct AccountViewInfo {
    let currency: Currency
    let amount: Double
    let accountName: String
    let cards: [CardThumbnailInfo]
}

enum Currency {
    case rub
    case usd
    case eur
}

struct CardThumbnailInfo {
    let id: String
    let image: UIImage
}
