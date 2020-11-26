//
//  UITheme.swift
//  PP2 - Game "Set"
//
//  Created by Михайло Єрошенко on 11.10.2020.
//

import Foundation

import UIKit

struct Theme {
    static let backgroundColor:         UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    static let cardColor:               UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let cardColorSelected:       UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    static let cardColorMatched:        UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    static let cardColorNotMatched:     UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    
    static let buttonCornerRadius:      CGFloat = 16
    static let cardButtonCornerRadius:  CGFloat = 16
    
    static let buttonColor:             UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    static let buttonColorDisabled:     UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    static let dealButtonEnabledColor:  UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    static let dealButtonDisabledColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

}
