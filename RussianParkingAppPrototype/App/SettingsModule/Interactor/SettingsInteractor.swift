//
//  SettingsInteractor.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

protocol SettingsInteractorProtocol {
    func takeData()
}

class SettingsInteractor: SettingsInteractorProtocol {
    
    //MARK: - Global properties
    
    weak var presenter: SettingsPresenterProtocol?
    private var settings = [SettingSection]()
    
    //MARK: - Initial
    
    init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }
    
    //MARK: - SettingsInteractorProtocol methods
    
    func takeData() {
        let data = Settings.getData()
        presenter?.get(data: data)
    }
}
