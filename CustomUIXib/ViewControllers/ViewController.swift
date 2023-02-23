//
//  ViewController.swift
//  HomeWork3_Ex6
//
//  Created by Kirill Romanenko on 26.10.2022.
//

import UIKit

class ViewController: UIViewController, MenuBlockDelegate {
    func menuElementPressed(tag: Int) {
        switch tag {
        case 1:
            print("Рассрочка на карту!")
        case 2:
            print("Покупка частями!")
        case 3:
            print("Архив!")
        default:
            print("Error")
        }
        print("Menu Item Pressed!")
    }
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet var viewsMenuBlock: [ViewMenuBlock]!
    @IBOutlet weak var mainViewForMenuBlock: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.insertSublayer(createCAGradientlayer(firstColor: UIColor(red: 65/255, green: 105/255, blue: 99/255, alpha: 255/255).cgColor, secondColor: UIColor(red: 98/255, green: 149/255, blue: 90/255, alpha: 255/255).cgColor), at: 0)
        
        mainViewForMenuBlock.backgroundColor = UIColor(red: 30/255, green: 20/255, blue: 30/255, alpha: 255/255)
        
        for item in viewsMenuBlock {
            item.clipsToBounds = true
            
            item.menuBlockView.backgroundColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 255/255)
            
            item.layer.cornerRadius = item.frame.height / 10
            item.delegate = self
        }
        
        viewsMenuBlock[0].configure(text: "Рассрочка на карту", image: UIImage(named: "circularDiagram")!, addGradient: true, .red, firstColor: UIColor(red: 65/255, green: 105/255, blue: 99/255, alpha: 255/255), secondColor: UIColor(red: 98/255, green: 149/255, blue: 90/255, alpha: 255/255))
        
        viewsMenuBlock[1].configure(text: "Покупка частями", image: UIImage(named: "paws")!, addGradient: true, .red, firstColor:UIColor(red: 108/255, green: 104/255, blue: 177/255, alpha: 255/255), secondColor: UIColor(red: 110/255, green: 104/255, blue: 176/255, alpha: 255/255))
        
        viewsMenuBlock[2].configure(text: "Архив", image: UIImage(named: "check")!, addGradient: true, .red, firstColor: UIColor(red: 122/255, green: 142/255, blue: 150/255, alpha: 255/255), secondColor: UIColor(red: 141/255, green: 160/255, blue: 173/255, alpha: 255/255))
        
    }
    
    func createCAGradientlayer(firstColor: CGColor, secondColor: CGColor) -> CAGradientLayer {
        let firstColor = firstColor
        let secondColor = secondColor
        
        let myCAGradient = CAGradientLayer()
        
        myCAGradient.type = .axial
            
        myCAGradient.colors = [firstColor, secondColor]
        myCAGradient.frame = topView.bounds
        myCAGradient.locations = [0.0, 1]

        myCAGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        myCAGradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        return myCAGradient
    }

}

