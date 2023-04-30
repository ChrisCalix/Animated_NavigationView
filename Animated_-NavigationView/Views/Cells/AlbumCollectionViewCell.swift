//
//  AlbumCollectionViewCell.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

final class AlbumCollectionViewCell: UICollectionViewCell, ReusableView {
    
    public lazy var albumCoverImageView = UIImageView()
    private lazy var albumNameLabel = UILabel.albumCoverLabel(type: .title)
    private lazy var albumReleaseYearLabel = UILabel.albumCoverLabel(type: .subtitle)
    private lazy var songsQuantityLabel = UILabel.albumCoverLabel(type: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

private extension AlbumCollectionViewCell {
    
    func setupUI() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .albumBackgroundColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 24
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: 0, height: 1)
        layer.shadowRadius = 4
        
        contentView.addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumNameLabel)
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumReleaseYearLabel)
        albumReleaseYearLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(songsQuantityLabel)
        songsQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            albumCoverImageView.widthAnchor.constraint(equalToConstant: 200),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 200),
            albumCoverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 25),
            albumNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            albumNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 25),
            albumNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            albumNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            albumNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            songsQuantityLabel.topAnchor.constraint(equalTo: albumReleaseYearLabel.bottomAnchor, constant: 16),
            songsQuantityLabel.leftAnchor.constraint(equalTo: albumReleaseYearLabel.leftAnchor),
            songsQuantityLabel.rightAnchor.constraint(equalTo: albumReleaseYearLabel.rightAnchor),
        ])
        
        albumCoverImageView.clipsToBounds = true
        albumCoverImageView.layer.cornerRadius = 100
        albumCoverImageView.contentMode = .scaleAspectFit
    }
}

extension AlbumCollectionViewCell {
    
    public func configure(with album: Album) {
        
        albumCoverImageView.image = UIImage(named: album.coverImage)
        albumNameLabel.text = album.name
        albumReleaseYearLabel.text = "\(album.releaseYear)"
        songsQuantityLabel.text = "\(album.songs.count) songs"
    }
    
    public func animateCellOut(_ completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.5, animations:  {
            self.albumNameLabel.alpha = 0
            self.albumReleaseYearLabel.alpha = 0
            self.songsQuantityLabel.alpha = 0
        }, completion: { _ in
            completion()
        })
    }
}
