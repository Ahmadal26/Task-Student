//
//  DetailViewController.swift
//  Student
//
//  Created by Ahmad Musallam on 03/03/2024.
//

import SnapKit
import UIKit

class DetailViewController: UIViewController {
    
    var student: Student?
    
    private let nameLabel = UILabel()
    private let gpaLabel = UILabel()
    private let profileImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        configureWithStudentAccount()
        applyGradientBackground()
    }
    
    private func setupViews() {
      
        
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = UIColor.white
        
        gpaLabel.font = .systemFont(ofSize: 18, weight: .regular)
        gpaLabel.textColor = UIColor.white
        
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.shadowColor = UIColor.black.cgColor
        profileImageView.layer.shadowOpacity = 0.7
        profileImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        profileImageView.layer.shadowRadius = 5
        
        view.addSubview(nameLabel)
        view.addSubview(gpaLabel)
        view.addSubview(profileImageView)
    }
    
    private func setupLayout() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        gpaLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureWithStudentAccount() {
        nameLabel.text = "Student Name: \(student?.name ?? "N/A")"
        gpaLabel.text = "GPA: \(student?.GPA ?? 0.0)"
        profileImageView.image = UIImage(named: student?.profileImage ?? "image")
    }
    
    private func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemGray.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
