//
//  PagingConfig.swift
//
//  Created by Artur on 22/06/2020.
//

import CoreGraphics

struct HorizontalCellPagingConfig {
    var cellWidth: CGFloat
    var offset: CGFloat
}

extension HorizontalCellPagingConfig {
    init(grupa: GrupaKafelekRecept) {
        cellWidth = grupa.wielkoscKafelekRecepty.width
        offset = grupa.separator / 2
    }
}

struct HorizontalCellPagingOffset {
    let right: CGFloat
    let left: CGFloat
    let velocity: CGPoint
}
