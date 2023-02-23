//
//  ViewRate.swift
//  HomeWork3_Ex6
//
//  Created by Kirill Romanenko on 26.10.2022.
//

import UIKit

class ViewRate: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainRateView: UIView!
    
    @IBOutlet weak var firstViewInMainRateView: UIView!
    let kCONTENT_XIB_NAME = "ViewRate"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
        
        mainRateView.layer.cornerRadius = mainRateView.frame.height / 4
        mainRateView.clipsToBounds = true
        
        firstViewInMainRateView.layer.borderWidth = 1
        
        firstViewInMainRateView.layer.borderColor = UIColor.black.cgColor
        
        contentView.layer.insertSublayer(createCAGradientlayer(firstColor: UIColor(red: 62/255, green: 81/255, blue: 98/255, alpha: 255/255).cgColor, secondColor: UIColor.white.cgColor), at: 0)
        
    }
    
    func createLabel(_ centerX: CGFloat, _ centerY: CGFloat, _ myWidth: CGFloat, _ myHeight: CGFloat, _ text: String) -> UILabel {
        
        let labelRate = UILabel(frame: CGRect(x: 0, y: 0, width: myWidth, height: myHeight))
        let myCGPoint = CGPoint(x: centerX, y: centerY)
        
        labelRate.center = myCGPoint
        labelRate.textColor = .white
        labelRate.font = .systemFont(ofSize: 20)
        labelRate.text = text
        labelRate.textAlignment = .center
        
        return labelRate
        
    }
    
    func createRateView(_ centerX: CGFloat, _ centerY: CGFloat, _ myWidth: CGFloat, _ myHeight: CGFloat) -> UIView {
        let rateView = UIView(frame: CGRect(x: 0, y: 0, width: myWidth, height: myHeight))
        
        rateView.center = CGPoint(x: centerX, y: centerY + myHeight/4)
        
        rateView.backgroundColor = .white
        rateView.layer.cornerRadius = 20
        rateView.alpha = 0.3
        
        return rateView
    }
    
    func createCAGradientlayer(firstColor: CGColor, secondColor: CGColor) -> CAGradientLayer {
        let firstColor = UIColor(red: 62/255, green: 81/255, blue: 98/255, alpha: 255/255).cgColor
        let secondColor = UIColor.white.cgColor
        
        let myCAGradient = CAGradientLayer()
        
        myCAGradient.type = .axial
            
        myCAGradient.colors = [secondColor, firstColor, secondColor]
        myCAGradient.frame = contentView.bounds
        myCAGradient.locations = [-5.0, 0.5, 5.0]
        
        myCAGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        myCAGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        return myCAGradient
    }
    
}
