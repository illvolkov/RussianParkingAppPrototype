//
//  MapPresenter.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol MapPresenterProtocol: AnyObject {
    func handleSettingsButton()
}

class MapPresenter: MapPresenterProtocol {
    
    //MARK: - Global properties
    
    weak var viewController: MapControllerProtocol?
    var interactor: MapInteractorProtocol?
    var router: MapRouterProtocol?
    
    //MARK: - Initial
    
    init(viewController: MapControllerProtocol) {
        self.viewController = viewController
    }
    
    //MARK: - MapPresenterProtocol methods
    
    func handleSettingsButton() {
        router?.goToSettingsModule()
    }
}
