//
//  UIHorizontalCellPagingFlowLayout.swift
//
//  Created by Artur on 22/06/2020.
//

import UIKit

class UIHorizontalCellPagingFlowLayout: UICollectionViewFlowLayout {
    private var config: HorizontalCellPagingConfig!
    
    convenience init(config: HorizontalCellPagingConfig) {
        self.init()
        self.config = config
        scrollDirection = .horizontal
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        guard let collectionView = self.collectionView else {
            let latestOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            return latestOffset
        }

        let horizontalOffset = HorizontalCellPagingOffset(right: collectionView.contentOffset.x,
                                                          left: collectionView.contentInset.left,
                                                          velocity: velocity)
        
        let horizontalCalculator = HorizontalContentOffsetCalculator(pagingConfig: config,
                                                                 pagingOffset: horizontalOffset)

        return CGPoint(x: horizontalCalculator.offsetX, y: proposedContentOffset.y)
    }
    
}
