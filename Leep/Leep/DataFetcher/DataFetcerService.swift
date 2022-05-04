//
//  DataFetcerService.swift
//  instas
//
//  Created by Владимир Данилович on 27.03.22.
//

import Foundation

protocol DataFetcherServiceProtocol {
    func fetchLocalCountry(completion: @escaping ([ImageDetail]?) -> Void)
}

/*
 Модуль высшего уровня
 Модуль верхнего уровня не должен зависеть от модулей нижнего уровня. Все зависят от абстракций.
 */

final class DataFetcherService: DataFetcherServiceProtocol {

    /*
     переименовали в networkDataFetcher и добавили localDataFetcher
     */

    /*
     Наши абстракции
     */

    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher

    init(dataFetcher: DataFetcher = NetworkDataFetcher(),
        localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }
    /*
     Added fetchLocalCountry
     */

    func fetchLocalCountry(completion: @escaping ([ImageDetail]?) -> Void) {
        localDataFetcher.fetchGenericJSONData(urlString: Constants.localUrlString, response: completion)
    }

    // @escaping - сбегабщее выражение (замыкание сбегает из области видимости ф-ции fetch...), необходимо для того что бы в конце выполнения ф-ции, блок задержался в памяти до того момента пока не прийдет ответ от сервера.
    // Показываем что замыкание будет вызвано после выполнения ф-ции. Такие ф-ции часто используются в асинхронных операциях
}
