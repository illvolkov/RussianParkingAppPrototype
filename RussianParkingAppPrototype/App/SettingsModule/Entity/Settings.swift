//
//  SettingsSection.swift
//  RussianParkingAppPrototype
//
//  Created by Ilya Volkov on 07.09.2022.
//

class Settings {
    static func getData() -> [SettingSection] {
        return [
            SettingSection(setting: [
                Setting(title: "+7 (954) 617-75-12", additionalTitle: nil)]),
            
            SettingSection(setting: [
                Setting(title: "Изменить завершенную парковку", additionalTitle: "0")]),
            
            SettingSection(setting: [
                Setting(title: "Пополнить счет", additionalTitle: "\(String(Int.random(in: 0...1000))) ₽"),
                Setting(title: "Аналитика расходов", additionalTitle: nil),
                Setting(title: "Уведомления", additionalTitle: "1"),
                Setting(title: "Новости", additionalTitle: nil),
                Setting(title: "История", additionalTitle: nil)]),
            
            SettingSection(setting: [
                Setting(title: "Автомобили", additionalTitle: nil)]),
            
            SettingSection(setting: [
                Setting(title: "Штрафы и эвакуации", additionalTitle: nil)]),
            
            SettingSection(setting: [
                Setting(title: "Банковские карты", additionalTitle: nil),
                Setting(title: "Настройки", additionalTitle: nil)]),
            
            SettingSection(setting: [
                Setting(title: "Обратная связь", additionalTitle: nil),
                Setting(title: "Транспортные приложения", additionalTitle: nil),
                Setting(title: "О приложении", additionalTitle: nil)
            ])
        ]
    }
}
