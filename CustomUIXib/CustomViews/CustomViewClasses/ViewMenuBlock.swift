//
//  ViewMenuBlock.swift
//  HomeWork3_Ex6
//
//  Created by Kirill Romanenko on 26.10.2022.
//

import UIKit

class ViewMenuBlock: UIView {
    
    var delegate: MenuBlockDelegate?
    
    @IBOutlet weak var menuBlockView: UIView!
    @IBOutlet weak var labelForText: UILabel!
    @IBOutlet weak var viewForImageView: UIView!
    @IBOutlet weak var circleImageView: UIImageView!
    
    let kCONTENT_XIB_NAME = "ViewMenuBlock"
    
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
        menuBlockView.fixInView(self)
        labelForText.textColor = .white
        viewForImageView.layer.cornerRadius = viewForImageView.frame.height / 2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.elementPressed(sender:)))
        menuBlockView.isUserInteractionEnabled = true
        menuBlockView.addGestureRecognizer(tap)
        
    }
    
    func configure(text: String, image:UIImage, addGradient: Bool, _ backGroundColor: UIColor, firstColor: UIColor, secondColor: UIColor){
        
        if addGradient {
            viewForImageView.layer.insertSublayer(createCAGradientlayer(firstColor: firstColor.cgColor, secondColor: secondColor.cgColor), at: 0)
        }else{
            viewForImageView.backgroundColor = backGroundColor
        }
        circleImageView.image = image
        labelForText.text = text
        
    }
    
    @objc func elementPressed(sender: UITapGestureRecognizer){
        delegate?.menuElementPressed(tag: self.tag)
    }
    
    func createCAGradientlayer(firstColor: CGColor, secondColor: CGColor) -> CAGradientLayer {
        let firstColor = firstColor
        let secondColor = secondColor
        
        let myCAGradient = CAGradientLayer()
        
        myCAGradient.type = .axial
            
        myCAGradient.colors = [firstColor, secondColor]
        myCAGradient.frame = viewForImageView.bounds
        myCAGradient.locations = [0.0, 1]

        myCAGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        myCAGradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        myCAGradient.cornerRadius = viewForImageView.frame.height / 2
        
        return myCAGradient
    }
    
}

protocol MenuBlockDelegate {
    func menuElementPressed(tag: Int)
}

