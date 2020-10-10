//
//  ViewController.swift
//  ChangeIcon
//
//  Created by Raphael Oliveira on 10/10/20.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var n64Button: UIButton = {
        let b = CIButton(backgroundColor: .black)
        b.setImage(UIImage(named: "n64-icon"), for: .normal)
        b.addTarget(self, action: #selector(n64IconTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var psButton: UIButton = {
        let b = CIButton(backgroundColor: .black)
        b.setImage(UIImage(named: "ps-icon"), for: .normal)
        b.addTarget(self, action: #selector(psIconTapped), for: .touchUpInside)
        return b
    }()
    
    fileprivate lazy var segaButton: UIButton = {
        let b = CIButton(backgroundColor: .black)
        b.setImage(UIImage(named: "sega-icon"), for: .normal)
        b.addTarget(self, action: #selector(segaIconTapped), for: .touchUpInside)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }

    fileprivate func setupLayout() {
        view.addSubview(n64Button)
        n64Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            n64Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            n64Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            n64Button.widthAnchor.constraint(equalToConstant: 150),
            n64Button.heightAnchor.constraint(equalTo: n64Button.widthAnchor)
        ])
        
        view.addSubview(psButton)
        psButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            psButton.centerXAnchor.constraint(equalTo: n64Button.centerXAnchor),
            psButton.bottomAnchor.constraint(equalTo: n64Button.topAnchor, constant: -40),
            psButton.widthAnchor.constraint(equalTo: n64Button.widthAnchor),
            psButton.heightAnchor.constraint(equalTo: psButton.widthAnchor)
        ])
        
        view.addSubview(segaButton)
        segaButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segaButton.centerXAnchor.constraint(equalTo: n64Button.centerXAnchor),
            segaButton.topAnchor.constraint(equalTo: n64Button.bottomAnchor, constant: 40),
            segaButton.widthAnchor.constraint(equalTo: psButton.widthAnchor),
            segaButton.heightAnchor.constraint(equalTo: segaButton.widthAnchor)
        ])
    }
    
    // MARK: - Selectors
    
    @IBAction func n64IconTapped(_ sender: UIButton) {
        changeIcon(to: "n64")
    }
    
    @IBAction func psIconTapped(_ sender: UIButton) {
        changeIcon(to: "ps")
    }
    
    @IBAction func segaIconTapped(_ sender: UIButton) {
        changeIcon(to: "sega")
    }


}

extension ViewController {
    func changeIcon(to name: String?) {
        //Verifica se o app suporta troca de ícones
        guard UIApplication.shared.supportsAlternateIcons else {
            return;
        }
        
        // Troca o ícone para uma imágem específica a prtir do nome informado
        UIApplication.shared.setAlternateIconName(name) { (error) in
            // Depois da troca printa uma memsagem de erro ou de sucesso.
            if let error = error {
                print("App icon failed to due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully.")
            }
        }
    }
}

