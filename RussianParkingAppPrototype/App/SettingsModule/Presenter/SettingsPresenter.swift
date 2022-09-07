//
//  SettingsPresenter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsPresenterProtocol: AnyObject {
    
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    //MARK: - Global properties
    
    weak var viewController: SettingsControllerProtocol?
    var interactor: SettingsInteractorProtocol?
    var router: SettingsRouterProtocol?
    
    //MARK: - Initial
    
    init(viewController: SettingsControllerProtocol) {
        self.viewController = viewController
    }
}
