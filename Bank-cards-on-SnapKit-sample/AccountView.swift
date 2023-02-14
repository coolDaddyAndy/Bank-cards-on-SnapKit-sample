//
//  AccountView.swift
//  Bank-cards-on-SnapKit-sample
//
//  Created by Andrei Sushkou on 14.02.23.
//

import SnapKit
import UIKit

class AccountView: UIView {
    // MARK: - Public
    func configure(with info: AccountViewInfo) {
        currencyImageView.image = makeCurrencyImage(for: info.currency)
        amountLabel.text = makeAmountLabelText(for: info.currency, amount: info.amount)
        accountNameLabel.text = info.accountName
        cards = info.cards
        collectionView.reloadData()
    }
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private constants
    private enum UIConstants {
        static let cornerRadius: CGFloat = 16
        static let cardWidth: CGFloat = 45
        static let cardHeight: CGFloat = 30
        static let contentInset: CGFloat = 16
        static let currencySignImageSize: CGFloat = 25
        static let xStackSpacing: CGFloat = 16
        static let yStackSpacing: CGFloat = 8
    }
    
    // MARK: - Private properties
    private let currencyImageView: UIImageView = {
       let view = UIImageView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let amountLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private let accountNameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private var collectionView: UICollectionView!
    private var cards: [CardThumbnailInfo] = []
}


    // MARK: - Private methods
private extension AccountView {
    func initialize() {
        backgroundColor = UIColor(named: "BackgroundColor")
        layer.cornerRadius = UIConstants.cornerRadius
        // Vertical stack configuration
        let yStack = UIStackView()
        yStack.axis = .vertical
        yStack.spacing = UIConstants.yStackSpacing
        yStack.addArrangedSubview(amountLabel)
        yStack.addArrangedSubview(accountNameLabel)
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AccountViewCardCell.self,
                                forCellWithReuseIdentifier: String(describing: AccountViewCardCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.cardHeight)
        }
        yStack.addArrangedSubview(collectionView)
        
        // Horizontal stack configuration
        let xStack = UIStackView()
        xStack.axis = .horizontal
        xStack.alignment = .top
        xStack.spacing = UIConstants.xStackSpacing
        currencyImageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.currencySignImageSize)
        }
        xStack.addArrangedSubview(currencyImageView)
        xStack.addArrangedSubview(yStack)
        addSubview(xStack)
        xStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    func makeCurrencyImage(for currency: Currency) -> UIImage? {
        switch currency {
        case .usd:
            return UIImage(systemName: "star")!
        case .rub:
            return UIImage(systemName: "star")!
        case .eur:
            return UIImage(systemName: "star")!
        }
    }
    
    func makeAmountLabelText(for currency: Currency,  amount: Double) -> String {
        var currencySign: String {
            switch currency {
            case .rub:
                return "rub"
            case .usd:
                return "$"
            case .eur:
                return "eur"
            }
        }
        return "\(amount) \(currencySign)"
    }
    
}

// MARK: - UICollectionViewDataSource
extension AccountView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AccountViewCardCell.self),
                                                      for: indexPath) as! AccountViewCardCell
        let image = cards[indexPath.item].image
        cell.configure(with: image)
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AccountView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cardWidth, height: UIConstants.cardHeight)
    }
}

