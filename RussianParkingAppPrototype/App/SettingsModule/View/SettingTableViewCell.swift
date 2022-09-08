//
//  SettingTableViewCell.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "SettingTableViewCell"
    
    //MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * adaptationToDifferentScreenSize(withiPodValue: 0.04,
                                                                                                   defaultValue: 0.05))
        label.textColor = .black
        return label
    }()
    
    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * adaptationToDifferentScreenSize(withiPodValue: 0.04,
                                                                                                   defaultValue: 0.05))
        label.textColor = .black
        label.textAlignment = .right
        label.alpha = 0.6
        return label
    }()
        
    private lazy var additionalNoticeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: contentView.frame.width * adaptationToDifferentScreenSize(withiPodValue: 0.045,
                                                                                                   defaultValue: 0.05))
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = contentView.frame.width * 0.04
        label.layer.masksToBounds = true
        return label
    }()
    
    //MARK: - Settings
    
    private func setupLayout(with indexPath: IndexPath) {
        
        let frame = contentView.frame
        
        contentView.addSubview(titleLabel)
        accessoryType = .disclosureIndicator
        
        titleLabel.frame = CGRect(x: frame.width * 0.05,
                                  y: frame.height / 2 - (frame.height * 0.4 / 2),
                                  width: frame.width * adaptationToDifferentScreenSize(withiPodValue: 0.8,
                                                                                       defaultValue: 0.9),
                                  height: frame.height * 0.4)
        
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            titleLabel.alpha = 0.6
            
        }
        
        if indexPath.section == 1 && indexPath.row == 0 || indexPath.section == 2 && indexPath.row == 0 {
            
            contentView.addSubview(additionalLabel)
            
            additionalLabel.frame = CGRect(x: adaptationToDifferentScreenSize(withiPodValue: 245,
                                                                              defaultValue: 300),
                                           y: frame.height / 2 - (frame.height * 0.4 / 2),
                                           width: frame.width * adaptationToDifferentScreenSize(withiPodValue: 0.13,
                                                                                                defaultValue: 0.16),
                                           height: frame.height * adaptationToDifferentScreenSize(withiPodValue: 0.4,
                                                                                                  defaultValue: 0.45))
            
        }
        
        if indexPath.section == 2 && indexPath.row == 2 {
            
            contentView.addSubview(additionalNoticeLabel)
            
            additionalNoticeLabel.frame = CGRect(x: adaptationToDifferentScreenSize(withiPodValue: 260,
                                                                                    defaultValue: 330),
                                                 y: frame.height * 0.22,
                                                 width: frame.width * 0.08,
                                                 height: frame.width * 0.08)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.alpha = 1
    }
    
    private func adaptationToDifferentScreenSize(withiPodValue: CGFloat, defaultValue: CGFloat) -> CGFloat {
        let device = UIDevice()
        
        if device.name == "iPod touch (7th generation)" {
            return withiPodValue
        } else {
            return defaultValue
        }
    }
    
    func configure(with model: Setting, indexPath: IndexPath) {
        titleLabel.text = model.title
        additionalLabel.text = model.additionalTitle
        additionalNoticeLabel.text = model.additionalTitle
        
        setupLayout(with: indexPath)
    }
}
