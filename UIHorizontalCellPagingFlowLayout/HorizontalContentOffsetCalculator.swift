//
//  HorizontalContentOffsetCalculator.swift
//
//  Created by Artur on 22/06/2020.
//

import CoreGraphics

struct HorizontalContentOffsetCalculator {
    var velocityModifier: CGFloat = 0.3
    var offsetModifier: CGFloat = 0.0
    
    let offsetRight: CGFloat
    let insetLeft: CGFloat
    let pageWidth: CGFloat
    let velocity: CGPoint
    
    private var currentPagePosition: CGFloat {
        return offsetRight/pageWidth
    }
    
    private var currentPage: CGFloat {
        return velocity.x == 0 ? round(currentPagePosition) : (velocity.x < 0.0 ? floor(currentPagePosition) : ceil(currentPagePosition))
    }
    
    private var pagedVelocity: CGFloat {
        return velocity.x * velocityModifier
    }
    
    private var paginatedPages: CGFloat {
        return (abs(round(pagedVelocity)) <= 1) ? 0 : round(pagedVelocity)
    }
    
    private var paginatedWithPages: CGFloat {
        return currentPage + paginatedPages
    }
    
    private var wholePagedSpace: CGFloat {
        return paginatedWithPages * pageWidth
    }
    
    var offsetX: CGFloat {
        return (wholePagedSpace - insetLeft) - offsetModifier
    }
}

extension HorizontalContentOffsetCalculator {
    init(pagingConfig: HorizontalCellPagingConfig, pagingOffset: HorizontalCellPagingOffset) {
        offsetRight = pagingOffset.right
        insetLeft = pagingOffset.left
        velocity = pagingOffset.velocity
        
        pageWidth = pagingConfig.cellWidth
        offsetModifier = pagingConfig.offset
    }
}
