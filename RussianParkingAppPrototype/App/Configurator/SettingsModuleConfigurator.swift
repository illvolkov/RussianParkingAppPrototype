//
//  SettingsModuleConfugurator.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsModuleConfiguratorProtocol: AnyObject {
    func configure(with viewController: SettingsController)
}

class SettingsModuleConfigurator: SettingsModuleConfiguratorProtocol {
    func configure(with viewController: SettingsController) {
        let presenter = SettingsPresenter(viewController: viewController)
        let interactor = SettingsInteractor(presenter: presenter)
        let router = SettingsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
