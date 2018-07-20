//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

precedencegroup ForwardApplication {
    associativity: left
}
infix operator |>: ForwardApplication
func |> <A, B>(a: A, f: @escaping (A) -> B) -> B {
    return f(a)
}

//precedencegroup ForwardComposition {
//    associativity: left
//    higherThan: ForwardApplication
//}
//infix operator >>>: ForwardComposition
//func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
//    return { input in
//        return g(f(input))
//    }
//}

precedencegroup SingleComposition {
    associativity: left
    higherThan: ForwardApplication
}
infix operator <>: SingleComposition
func <> <A>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { value in
        f(value)
        g(value)
    }
}

func roundedStyle(_ cornerRadius: CGFloat) -> (UIView) -> Void {
    return { view in
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
    }
}

func borderStyle(color: UIColor, width: CGFloat) -> (UIView) -> Void {
    return { view in
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
    }
}

func baseButtonStyle(_ button: UIButton) {
    button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
}

func roundedStyle2(_ cornerRadius: CGFloat) -> (UIView) -> UIView {
    return { view in
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        return view
    }
}

func borderStyle2(color: UIColor, width: CGFloat) -> (UIView) -> UIView {
    return { view in
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        return view
    }
}

func baseButtonStyle2(titleColor: UIColor) -> (UIButton) -> UIButton {
    return { button in
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.setTitleColor(titleColor, for: .normal)
        return button
    }
}

func filledViewStyle(_ color: UIColor) -> (UIView) -> UIView {
    return { view in
        view.backgroundColor = color
        return view
    }
}

func button(title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    return button
}

struct ButtonStyles {
    static let normalButton = baseButtonStyle
        <> roundedStyle(2)
        <> borderStyle(color: .cyan, width: 2)
    
    static func testButton(_ button: UIButton) -> UIView {
        return button
            |> baseButtonStyle2(titleColor: .white)
            |> borderStyle2(color: .red, width: 5)
            |> roundedStyle2(10)
            |> filledViewStyle(.brown)
        
    }
}

class TestController: UIViewController {
    let second = button(title: "Second button")
        |> baseButtonStyle2(titleColor: .white)
        |> borderStyle2(color: .red, width: 5)
        |> roundedStyle2(10)
        |> filledViewStyle(.brown)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        
        
        
        let first = button(title: "First button")
        ButtonStyles.normalButton(first)
        
        
//        first |>
//            baseButtonStyle
//            <> borderStyle(color: .blue, width: 2)
//            <> roundedStyle(6)
        
        let stackView = stack()
        stackView.addArrangedSubview(first)
        stackView.addArrangedSubview(second)
        stackView.addArrangedSubview(ButtonStyles.testButton(button(title: "Third button")))
    }
    
    func stack() -> UIStackView {
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
        return stackView
    }
}

PlaygroundPage.current.liveView = TestController()
