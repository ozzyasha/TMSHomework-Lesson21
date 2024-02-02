//
//  ViewController.swift
//  TMSHomework-Lesson21
//
//  Created by Наталья Мазур on 2.02.24.
//

import UIKit

class ViewController: UIViewController {
    weak var label: UILabel!
    weak var attributesButton: UIButton!
    var attributedString: NSMutableAttributedString!
    var viewModel = LabelTextViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label = makeLabel(size: viewModel.defaultText.textSize, text: viewModel.defaultText.string)
        setupAttributedString()
        attributesButton = makeButton(buttonTitle: "Add Attributes", action: #selector(addAttributesButtonTapped), otherElementBottomAnchor: label.bottomAnchor)
        attributesButton = makeButton(buttonTitle: "Remove Attributes", action: #selector(removeAttributesButtonTapped), otherElementBottomAnchor: attributesButton.bottomAnchor)
    }

    private func setupDefautLabelText() {
        label.text = viewModel.defaultText.string
    }

    private func setupAttributedString() {
        let labelText = viewModel.defaultText.string
        attributedString = NSMutableAttributedString(string: labelText)
    }

    private func setupColorForWordInAttributedLabelText(color: UIColor, word: String, isBold: Bool) {
        let labelText = viewModel.defaultText.string
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
        ]
        let range = findWordPositioninAttributedString(word: word, in: labelText)

        attributedString.addAttributes(labelAttributes, range: range ?? NSMakeRange(0, 0))

        if isBold {
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: viewModel.defaultText.textSize), range: range ?? NSMakeRange(0, 0))
        }

        label.attributedText = attributedString
    }
    
    private func setupUnderlineForLineInAttributedString(line: Int) {
        let labelText = viewModel.defaultText.string
        let range = findTextLineinAttributedString(in: labelText, line: line)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range ?? NSMakeRange(0, 0))
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
    
    private func findTextLineinAttributedString(in text: String, line: Int) -> NSRange? {
        
        if let text = label.text {
            let lines = text.split(separator: "\n")
            if lines.count >= line {
                let linePosition = lines[line - 1]
                
                if let textRange = text.range(of: linePosition) {
                    let location = text.distance(from: text.startIndex, to: textRange.lowerBound)
                    let length = text.distance(from: textRange.lowerBound, to: textRange.upperBound)
                    return NSMakeRange(location, length)
                }
            }
        }
        
        return nil
    }

    @objc func addAttributesButtonTapped() {
        setupColorForWordInAttributedLabelText(color: .blue, word: "Lorem", isBold: true)
        setupColorForWordInAttributedLabelText(color: .green, word: "ipsum", isBold: false)
        setupColorForWordInAttributedLabelText(color: .red, word: "amet", isBold: false)
        setupUnderlineForLineInAttributedString(line: 2)
    }

    @objc func removeAttributesButtonTapped() {
        setupDefautLabelText()
    }
}

// ДЗ:
// Создайте экран с использованием UIViewController. На этом экране должен быть UILabel для отображения текста. +
//
// Используйте NSAttributedString для создания стилизованного текста в UILabel. +
//
// Ваш текст должен включать следующие атрибуты:
//
// Разные цвета для различных слов. +
// - Жирный и обычный шрифт для разных фраз. +
// - Подчеркивание для одного из абзацев. +
// - Любые другие атрибуты, которые вы считаете интересными.
//
// Реализуйте кнопку на экране. При нажатии на кнопку, текст в UILabel должен измениться, добавив новые атрибуты. +
//
// Добавьте еще одну кнопку для сброса текста в исходное состояние (без атрибутов). +
//
// Добавьте возможность изменять атрибуты текста (цвет, стиль, размер шрифта) с использованием UISegmentedControl или других интерактивных элементов.
