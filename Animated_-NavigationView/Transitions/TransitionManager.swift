//
//  TransitionManager.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

final class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let duration: TimeInterval
    private var operation: UINavigationController.Operation
    
    init(duration: TimeInterval) {
        
        self.duration = duration
        self.operation = .push
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromViewController = transitionContext.viewController(forKey: .from),
              let toViewController = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        animateTransition(from: fromViewController, to: toViewController, with: transitionContext)
    }
}

extension TransitionManager: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.operation = operation
        if operation == .push {
            return self
        }
        
        return nil
    }
}

private extension TransitionManager {
    
    func animateTransition(from fromViewController: UIViewController, to toViewController: UIViewController, with context: UIViewControllerContextTransitioning) {
        
        switch operation {
        case .push:
            guard let albumsViewConrtoller = fromViewController as? AlbumsViewController,
                  let detailsViewController = toViewController as? AlbumDetailViewController else {
                return
            }
            
            presentViewConrtoller(detailsViewController, from: albumsViewConrtoller, with: context)
        case.pop:
            guard let albumsViewConrtoller = fromViewController as? AlbumsViewController,
                  let detailsViewController = toViewController as? AlbumDetailViewController else {
                return
            }
            
            dismissViewConrtoller(detailsViewController, to: albumsViewConrtoller)
        
        default:
            break
        }
    }
    
    func presentViewConrtoller(_ toViewConrtoller: AlbumDetailViewController, from fromViewController: AlbumsViewController, with context: UIViewControllerContextTransitioning) {
        
        guard let albumCell = fromViewController.currentCell,
              let albumCoverImageView = fromViewController.currentCell?.albumCoverImageView,
              let albumDetailHeaderView = toViewConrtoller.headerView else {
            return
        }
                
        toViewConrtoller.view.layoutIfNeeded()
        
        let containerView = context.containerView
        
        let snapshotContentView = UIView()
        snapshotContentView.backgroundColor = .albumBackgroundColor
        snapshotContentView.frame = containerView.convert(albumCell.contentView.frame, from: albumCell)
        snapshotContentView.layer.cornerRadius = albumCell.contentView.layer.cornerRadius
        
        let snapshotAlbumCoverImageView = UIImageView()
        snapshotAlbumCoverImageView.clipsToBounds = true
        snapshotAlbumCoverImageView.contentMode = albumCoverImageView.contentMode
        snapshotAlbumCoverImageView.image = albumCoverImageView.image
        snapshotAlbumCoverImageView.layer.cornerRadius = albumCoverImageView.layer.cornerRadius
        snapshotAlbumCoverImageView.frame = containerView.convert(albumCoverImageView.frame, from: albumCell)
        
        containerView.addSubview(toViewConrtoller.view)
        containerView.addSubview(snapshotContentView)
        containerView.addSubview(snapshotAlbumCoverImageView)
        
        toViewConrtoller.view.isHidden = true
        
        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            snapshotContentView.frame = containerView.convert(toViewConrtoller.view.frame, from: toViewConrtoller.view)
            snapshotAlbumCoverImageView.frame = containerView.convert(albumDetailHeaderView.albumCoverImageView.frame, from: albumDetailHeaderView)
            snapshotAlbumCoverImageView.layer.cornerRadius = 0
        }
        
        animator.addCompletion { position in
            toViewConrtoller.view.isHidden = false
            snapshotAlbumCoverImageView.removeFromSuperview()
            snapshotContentView.removeFromSuperview()
            context.completeTransition(position == .end)
        }
        
        animator.startAnimation()
    }
    
    func dismissViewConrtoller(_ fromViewConrtoller: AlbumDetailViewController, to toViewConrtoller: AlbumsViewController) {
        
    }
}

