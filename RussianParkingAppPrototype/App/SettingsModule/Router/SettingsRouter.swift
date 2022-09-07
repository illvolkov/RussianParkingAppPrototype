//
//  SettingsRouter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsRouterProtocol: AnyObject {
    
}

class SettingsRouter: SettingsRouterProtocol {
    
    //MARK: - Global properties
    
    weak var viewController: SettingsControllerProtocol?
    
    //MARK: - Initial
    
    init(viewController: SettingsControllerProtocol) {
        self.viewController = viewController
    }
}
