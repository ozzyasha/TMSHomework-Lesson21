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
    weak var segmentedControlStack: UIStackView!
    var colorsSegmentedControl: UISegmentedControl!
    var boldSegmentedControl: UISegmentedControl!
    var underlineSegmentedControl: UISegmentedControl!
    
    var attributedString: NSMutableAttributedString!
    var viewModel = LabelTextViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        label = makeLabel(size: viewModel.defaultText.textSize, text: viewModel.defaultText.string)
        setupAttributedString()
        attributesButton = makeButton(buttonTitle: "Add Attributes", action: #selector(addAttributesButtonTapped), otherElementBottomAnchor: label.bottomAnchor)
        attributesButton = makeButton(buttonTitle: "Remove Attributes", action: #selector(removeAttributesButtonTapped), otherElementBottomAnchor: attributesButton.bottomAnchor)
        segmentedControlStack = makeVStackWithSegmentedControls()
    }
    
    private func removeAllAttriutes() {
        let range = findWordPositioninAttributedString(word: viewModel.defaultText.string, in: viewModel.defaultText.string)
        attributedString.removeAttribute(.font, range: range ?? NSMakeRange(0, 0))
        attributedString.removeAttribute(.underlineStyle, range: range ?? NSMakeRange(0, 0))
        attributedString.removeAttribute(.foregroundColor, range: range ?? NSMakeRange(0, 0))
        label.attributedText = attributedString
    }

    private func setupDefautLabelText() {
        label.text = viewModel.defaultText.string
    }

    private func setupAttributedString() {
        let labelText = viewModel.defaultText.string
        attributedString = NSMutableAttributedString(string: labelText)
    }

    private func setupColorForWordInAttributedLabelText(color: UIColor, word: String) {
        let labelText = viewModel.defaultText.string
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        let range = findWordPositioninAttributedString(word: word, in: labelText)

        attributedString.addAttributes(labelAttributes, range: range ?? NSMakeRange(0, 0))

        label.attributedText = attributedString
    }
    
    private func setupBoldForWordInAttributedLabelText(isBold: Bool, word: String) {
        let labelText = viewModel.defaultText.string
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: viewModel.defaultText.textSize)
        ]
        let range = findWordPositioninAttributedString(word: word, in: labelText)

        if isBold {
            attributedString.addAttributes(labelAttributes, range: range ?? NSMakeRange(0, 0))
        } else {
            attributedString.removeAttribute(labelAttributes.keys.first!, range: range ?? NSMakeRange(0, 0))
        }

        label.attributedText = attributedString
    }
    
    private func setupUnderlineForWordInAttributedLabelText(isUnderlined: Bool, word: String) {
        let labelText = viewModel.defaultText.string
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let range = findWordPositioninAttributedString(word: word, in: labelText)
        if isUnderlined {
            attributedString.addAttributes(labelAttributes, range: range ?? NSMakeRange(0, 0))
        } else {
            attributedString.removeAttribute(labelAttributes.keys.first!, range: range ?? NSMakeRange(0, 0))
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
        setupColorForWordInAttributedLabelText(color: .blue, word: "Lorem")
        setupColorForWordInAttributedLabelText(color: .green, word: "ipsum")
        setupBoldForWordInAttributedLabelText(isBold: true, word: "Lorem ipsum")
        setupColorForWordInAttributedLabelText(color: .red, word: "amet")
        setupUnderlineForLineInAttributedString(line: 2)
    }

    @objc func removeAttributesButtonTapped() {
        removeAllAttriutes()
        setupDefautLabelText()
        makeSegmentedControlDisabled()
    }
    
    @objc func selectValue(target: UISegmentedControl) {
        let segmentIndex = target.selectedSegmentIndex
        let textOfSegment = target.titleForSegment(at: segmentIndex)
        let fullString = viewModel.defaultText.string
        
        if textOfSegment == "blue"{
            setupColorForWordInAttributedLabelText(color: .blue, word: fullString)
        } else if textOfSegment == "red" {
            setupColorForWordInAttributedLabelText(color: .red, word: fullString)
        } else if textOfSegment == "green" {
            setupColorForWordInAttributedLabelText(color: .green, word: fullString)
        } else if textOfSegment == "yellow" {
            setupColorForWordInAttributedLabelText(color: .yellow, word: fullString)
        }
        
        if textOfSegment == "make text bold" {
            setupBoldForWordInAttributedLabelText(isBold: true, word: fullString)
        } else if textOfSegment == "make text regular" {
            setupBoldForWordInAttributedLabelText(isBold: false, word: fullString)
        }
        
        if textOfSegment == "underlined" {
            setupUnderlineForWordInAttributedLabelText(isUnderlined: true, word: fullString)
        } else if textOfSegment == "not underlined" {
            setupUnderlineForWordInAttributedLabelText(isUnderlined: false, word: fullString)
        }
        
    }
    
    @objc func makeSegmentedControlDisabled() {
        colorsSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        boldSegmentedControl.selectedSegmentIndex = 1
        underlineSegmentedControl.selectedSegmentIndex = 1
    }
}

// ДЗ:
// Создайте экран с использованием UIViewController. На этом экране должен быть UILabel для отображения текста. +
//
// Используйте NSAttributedString для создания стилизованного текста в UILabel. +
//
// Ваш текст должен включать следующие атрибуты:
//
// - Разные цвета для различных слов. +
// - Жирный и обычный шрифт для разных фраз. +
// - Подчеркивание для одного из абзацев. +
// - Любые другие атрибуты, которые вы считаете интересными.
//
// Реализуйте кнопку на экране. При нажатии на кнопку, текст в UILabel должен измениться, добавив новые атрибуты. +
//
// Добавьте еще одну кнопку для сброса текста в исходное состояние (без атрибутов). +
//
// Добавьте возможность изменять атрибуты текста (цвет, стиль, размер шрифта) с использованием UISegmentedControl или других интерактивных элементов.
