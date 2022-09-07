//
//  SettingsController.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

import UIKit

protocol SettingsControllerProtocol: AnyObject {
    
}

class SettingsController: UIViewController, SettingsControllerProtocol {
    
    //MARK: - Global properties
    
    var presenter: SettingsPresenterProtocol?
    let configurator: SettingsModuleConfiguratorProtocol = SettingsModuleConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
    }
}
