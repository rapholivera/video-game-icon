//
//  CIButton.swift
//  ChangeIcon
//
//  Created by Raphael Oliveira on 10/10/20.
//

import UIKit

class CIButton: UIButton {
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor

        setupUI()

        addTarget(self, action: #selector(animatePressDown), for: .touchDown)
        addTarget(self, action: #selector(animatePressUp), for: .touchDragExit)
        addTarget(self, action: #selector(animatePressDown), for: .touchDragEnter)
        addTarget(self, action: #selector(animatePressUp), for: .touchUpInside)
    }

    // MARK: - Helper Functions

    @objc fileprivate func animatePressDown() {
        UIButton.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        })
    }

    @objc fileprivate func animatePressUp() {
        UIButton.animate(withDuration: 0.1, animations: {
            self.transform = .identity
        })
    }

    // MARK: - UI Setup

    fileprivate func setupUI() {
        layer.cornerRadius = 30
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 2.0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
