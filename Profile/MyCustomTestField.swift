//
//  MyCustomTestField.swift
//  Navigation
//
//  Created by Dmitrii Varlakhanov on 7/25/25.
//

import UIKit

class MyCustomTestField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: CGRect(x: 160, y: 188, width: 198, height: 40))
        
        self.backgroundColor = .white
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.textColor = .black
        self.text = "Listening to music"
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
}
