//
//  ViewModel.swift
//  TMSHomework-Lesson21
//
//  Created by Наталья Мазур on 2.02.24.
//

import Foundation

//protocol UpdateTextViewModelProtocol {
//    var updateText: ((Text)->())? { get set }
//    func setText()
//}

final class UpdateTextViewModel {
    var defaultText: Text = Text(string: "Default Text", textSize: 20)
    var newText: Text = Text(string: "Lorem ipsum\n" + "dolor sit amet,\n" + "consectetur adipiscing elit", textSize: 20)
}
