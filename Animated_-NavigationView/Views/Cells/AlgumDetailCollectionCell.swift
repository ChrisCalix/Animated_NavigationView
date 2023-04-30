//
//  AlgumDetailCollectionCell.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

final class AlbumDetailCollectionCell: UICollectionViewCell, ReusableView {
    
    private lazy var songTitleLabel = UILabel.albumDetailLabel(type: .song)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}

private extension AlbumDetailCollectionCell {
    
    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .songBackgroundColor
        
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 12
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 0, height: 3)
        layer.shadowRadius = 4
        
        contentView.addSubview(songTitleLabel)
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            songTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ])
    }
}


extension AlbumDetailCollectionCell {
    
    func configure(with title: String) {
        
        songTitleLabel.text = title
    }
}
