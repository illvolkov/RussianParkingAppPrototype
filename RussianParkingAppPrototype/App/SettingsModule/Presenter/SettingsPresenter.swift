//
//  SettingsPresenter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsPresenterProtocol: AnyObject {
    func get(data: [SettingSection])
    func configureView()
    func handleCloseButton()
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
    
    //MARK: - SettingsPresenterProtocol methods
    
    func configureView() {
        interactor?.takeData()
    }
    
    func get(data: [SettingSection]) {
        viewController?.configure(data: data)
    }
    
    func handleCloseButton() {
        router?.closeSettingsModule()
    }
}
