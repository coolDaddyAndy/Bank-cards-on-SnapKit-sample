//
//  AccountView.swift
//  Bank-cards-on-SnapKit-sample
//
//  Created by Andrei Sushkou on 14.02.23.
//

import SnapKit
import UIKit

class AccountView: UIView {
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - Private methods
private extension AccountView {
    func initialize() {
        backgroundColor = .cyan
    }
}

