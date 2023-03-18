//
//  MainConstants.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

enum AlertViewTitles: String {
    case noInternetConnection = "Нет интернет соединения"
    case errorTitle = "Ошибка"
    case noAuthorizationTitle = "Ошибка авторизации"
    case serverError = "Ошибка сервера"
}

enum AlertViewSubtitles: String {
    case noInternetConnectionDetail = "Проверьте подключение к Интернету и повторите попытку"
    case errorMSG = "Произошла ошибка"
    case noAuthorizationMessage = "Войдите и повторите попытку"
    case serverErrorDetail = "Похоже, что-то пошло не так\n попробуйте еще раз"
}

enum MainConstants: String {
    case service = "com.negative.Online-Shop"
    case link = "https://run.mocky.io/v3/"
}
