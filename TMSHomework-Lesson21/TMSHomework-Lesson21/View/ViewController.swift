//
//  ViewController.swift
//  TMSHomework-Lesson21
//
//  Created by Наталья Мазур on 2.02.24.
//

import UIKit

class ViewController: UIViewController {

    weak var label: UILabel!
    var viewModel = UpdateTextViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label = makeLabel(size: 20)
        setupDefautLabelText()
        setupColorForAttributedLabelText(color: .blue)
    }
    
    private func setupDefautLabelText() {
        label.text = viewModel.defaultText.string
    }
    
    private func setupColorForAttributedLabelText(color: UIColor) {
        let string = viewModel.newText.string
        let attributedString = NSMutableAttributedString(string: string)
        
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        
        let range = findWordPositioninAttributedString(word: "Lorem ipsum", in: string)
        attributedString.addAttributes(labelAttributes, range: range ?? NSMakeRange(0, 0))
        label.attributedText = attributedString
        
    }
    
    private func findWordPositioninAttributedString(word: String, in text: String) -> NSRange? {
        if let wordRange = text.range(of: word) {
            let location = text.distance(from: text.startIndex, to: wordRange.lowerBound)
            let length = text.distance(from: wordRange.lowerBound, to: wordRange.upperBound)
            return NSMakeRange(location, length)
        }
        
        return nil
    }

}

//ДЗ:
//Создайте экран с использованием UIViewController. На этом экране должен быть UILabel для отображения текста.
//
//Используйте NSAttributedString для создания стилизованного текста в UILabel.
//
//Ваш текст должен включать следующие атрибуты:
//
//Разные цвета для различных слов.
//- Жирный и обычный шрифт для разных фраз.
//- Подчеркивание для одного из абзацев.
//- Любые другие атрибуты, которые вы считаете интересными.
//
//Реализуйте кнопку на экране. При нажатии на кнопку, текст в UILabel должен измениться, добавив новые атрибуты.
//
//Добавьте еще одну кнопку для сброса текста в исходное состояние (без атрибутов).
//
//Добавьте возможность изменять атрибуты текста (цвет, стиль, размер шрифта) с использованием UISegmentedControl или других интерактивных элементов.
