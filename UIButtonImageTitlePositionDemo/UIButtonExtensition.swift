//
//  UIButtonExtensition.swift
//  UIButtonImageTitlePositionDemo
//
//  Created by JiongXing on 2017/2/22.
//  Copyright © 2017年 JiongXing. All rights reserved.
//

import Foundation

import UIKit

extension UIButton {
    enum ImagePosition {
        case left
        case right
        case top
        case bottom
    }
    
    /// 调整图片位置，返回调整后所需要的size
    /// 调用本方法前，请先确保imageView和titleLabel有值。
    @discardableResult
    func adjustImage(position: ImagePosition, spacing: CGFloat) -> CGSize {
        guard imageView != nil && titleLabel != nil else {
            return CGSize.zero
        }
        let imageSize = self.imageView!.intrinsicContentSize
        let titleSize = self.titleLabel!.intrinsicContentSize
        
        // 布局
        switch (position) {
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing / 2, bottom: 0, right: spacing / 2)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing / 2, bottom: 0, right: -spacing / 2)
            contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing / 2, bottom: 0, right: spacing / 2)
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: (titleSize.width + spacing / 2), bottom: 0, right: -(titleSize.width + spacing / 2))
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageSize.width + spacing / 2), bottom: 0, right: (imageSize.width + spacing / 2))
            contentEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, spacing / 2);
        case .top, .bottom:
            let imageOffsetX = (imageSize.width + titleSize.width) / 2 - imageSize.width / 2
            let imageOffsetY = imageSize.height / 2 + spacing / 2
            let titleOffsetX = (imageSize.width + titleSize.width / 2) - (imageSize.width + titleSize.width) / 2
            let titleOffsetY = titleSize.height / 2 + spacing / 2
            let changedWidth = titleSize.width + imageSize.width - max(titleSize.width, imageSize.width)
            let changedHeight = titleSize.height + imageSize.height + spacing - max(imageSize.height, imageSize.height)
            
            if position == .top {
                imageEdgeInsets = UIEdgeInsets(top: -imageOffsetY, left: imageOffsetX, bottom: imageOffsetY, right: -imageOffsetX)
                titleEdgeInsets = UIEdgeInsets(top: titleOffsetY, left: -titleOffsetX, bottom: -titleOffsetY, right: titleOffsetX)
                self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth / 2, changedHeight - imageOffsetY, -changedWidth / 2);
            } else {
                imageEdgeInsets = UIEdgeInsets(top: imageOffsetY, left: imageOffsetX, bottom: -imageOffsetY, right: -imageOffsetX)
                titleEdgeInsets = UIEdgeInsets(top: -titleOffsetY, left: -titleOffsetX, bottom: titleOffsetY, right: titleOffsetX)
                self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight - imageOffsetY, -changedWidth / 2, imageOffsetY, -changedWidth / 2);
            }
        }
        return self.intrinsicContentSize
    }
}
