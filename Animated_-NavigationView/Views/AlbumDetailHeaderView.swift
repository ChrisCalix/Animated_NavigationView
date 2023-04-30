//
//  AlbumDetailHeaderView.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

protocol AlbumDetailHeaderViewDelegate: AnyObject {
    
    func closeButtonDidTap()
}

final class AlbumDetailHeaderView: UIView {
    
    public lazy var closeButton = UIButton.closeButton()
    public lazy var albumCoverImageView = UIImageView()
    public lazy var albumTitleLabel = UILabel.albumDetailLabel(type: .title)
    
    let albumCoverImageName: String
    let albumTitle: String
    weak var delegate: AlbumDetailHeaderViewDelegate?
    
    init(frame: CGRect = .zero, albumCoverImageName: String, albumTitle: String, delegate: AlbumDetailHeaderViewDelegate? = nil) {
        self.albumCoverImageName = albumCoverImageName
        self.albumTitle = albumTitle
        self.delegate = delegate
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}

private extension AlbumDetailHeaderView {
    
    func setupUI() {
        
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        addSubview(albumCoverImageView)
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.image = UIImage(named: albumCoverImageName)
        addSubview(albumTitleLabel)
        albumTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        albumTitleLabel.text = albumTitle
        
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            
            albumCoverImageView.widthAnchor.constraint(equalToConstant: 200),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 200),
            albumCoverImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            albumCoverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            
            albumTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            albumTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            albumTitleLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 25),
            albumTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

private extension AlbumDetailHeaderView {
    
    @objc func closeButtonDidTap() {
        
        delegate?.closeButtonDidTap()
    }
}
