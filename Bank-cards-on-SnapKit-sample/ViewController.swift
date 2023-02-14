//
//  ViewController.swift
//  Bank-cards-on-SnapKit-sample
//
//  Created by Andrei Sushkou on 14.02.23.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let accountView = AccountView()
        let info = AccountViewInfo(currency: .usd,
                                   amount: 2342.25,
                                   accountName: "My account",
                                   cards: [CardThumbnailInfo(id: "", image: UIImage(named: "card")!),
                                          CardThumbnailInfo(id: "", image: UIImage(named: "card")!),
                                          CardThumbnailInfo(id: "", image: UIImage(named: "card")!)
                                        ])
        accountView.configure(with: info)
        view.backgroundColor = UIColor(named: "ViewsColor")
        view.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }


}

