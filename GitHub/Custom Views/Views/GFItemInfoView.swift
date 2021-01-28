import UIKit //  Created by Ivanov Viktor on 24.01.2021.

enum ItemInfoType {
    case repos, gists, followers, following
}


class GFItemInfoView: UIView {

    let symboleImageView: UIImageView = UIImageView()
    let titleLabel: GFTitleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel: GFTitleLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubview(symboleImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symboleImageView.translatesAutoresizingMaskIntoConstraints = false
        symboleImageView.contentMode = .scaleAspectFill
        symboleImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symboleImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symboleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symboleImageView.heightAnchor.constraint(equalToConstant: 20),
            symboleImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symboleImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symboleImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symboleImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symboleImageView.image = UIImage(systemName: SFSymbols.folder)
            titleLabel.text = "Public Repos"
        case .gists:
            symboleImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
        case .followers:
            symboleImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            symboleImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        countLabel.text = "\(count)"
    }
}
