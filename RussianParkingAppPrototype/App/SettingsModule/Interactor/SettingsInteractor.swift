//
//  SettingsInteractor.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsInteractorProtocol {
    
}

class SettingsInteractor: SettingsInteractorProtocol {
    
    //MARK: - Global properties
    
    weak var presenter: SettingsPresenterProtocol?
    
    //MARK: - Initial
    
    init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }
}
