//
//  UIView+Ext.swift
//  Swiggy
//
//  Created by Janvi Arora on 07/12/24.
//

import UIKit

extension UIView {
    
    /// A convenience method to disable `translatesAutoresizingMaskIntoConstraints`.
    func disableAutoresizing() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    /// Adds multiple subviews to the current view.
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
