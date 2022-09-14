//
//  MapModuleConfigurator.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol MapModuleConfiguratorProtocol {
    func configure(with viewController: MapController)
}

class MapModuleConfigurator: MapModuleConfiguratorProtocol {
    func configure(with viewController: MapController) {
        let presenter = MapPresenter(viewController: viewController)
        let interactor = MapInteractor(presenter: presenter)
        let router = MapRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
