//
//  Attribute.swift
//  Interviewproject1
//
//  Created by Jo on 17/01/23.
//

import Foundation
import UIKit


 class BaseButton: UIButton {
    
    var currentCornerRadius:Float?
    var indexPath: IndexPath?
    //MARK:- A - UIButton
    
    @IBInspectable var cornerRadius:Float{
        get{
            return Float(self.layer.cornerRadius)
        }
        set{
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth:Float{
        get{
            return Float(self.layer.borderWidth)
        }
        set{
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }else{
                return UIColor.clear
            }
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    
    @IBInspectable var roundCorners:Bool{
        get{
            return self.roundCorners
        }
        set{
            self.currentCornerRadius = Float(self.layer.cornerRadius)
            if newValue{
                self.layer.cornerRadius = self.frame.width/2
            }else{
                self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
            }
        }
    }
    
    @IBInspectable var shadowOffset:CGSize{
        get{
            let currentOffset = self.layer.shadowOffset
            // let offset:(width:Int,height:Int) = (Int(currentOffset.width),Int(currentOffset.height))
            return currentOffset
        }
        set{
            self.layer.shadowOffset = newValue
            
        }
    }
    
    @IBInspectable var shadowColor:UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.clear.cgColor)
        }
        
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    
    func setUpShadows(mask: CAShapeLayer){
        self.layer.masksToBounds = false
        self.layer.shadowPath = mask.path
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    //MARK:- B - UIButton
    //MARK:- Usage -> view.setSpecificRoundCorners([.topLeft, .bottomLeft], radius: 10)
    //Default Border Color and Width are set.
    func setSpecificRoundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.bounds
        borderLayer.path = mask.path
        borderLayer.lineWidth = CGFloat(self.borderWidth)
        borderLayer.strokeColor = self.borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(borderLayer)
        setUpShadows(mask: mask)
        
    }
}



/// image view
 class BaseImageView: UIImageView{
    var currentCornerRadius:Float?
    //MARK:- A - UIImageview
    
    @IBInspectable var cornerRadius:Float{
        get{
            return Float(self.layer.cornerRadius)
        }
        set{
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth:Float{
        get{
            return Float(self.layer.borderWidth)
        }
        set{
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }else{
                return UIColor.clear
            }
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    
    @IBInspectable var roundCorners:Bool{
        get{
            return self.roundCorners
        }
        set{
            self.currentCornerRadius = Float(self.layer.cornerRadius)
            if newValue{
                self.layer.cornerRadius = self.frame.width/2
            }else{
                self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
            }
        }
    }
    
    @IBInspectable var shadowOffset:CGSize{
        get{
            let currentOffset = self.layer.shadowOffset
            // let offset:(width:Int,height:Int) = (Int(currentOffset.width),Int(currentOffset.height))
            return currentOffset
        }
        set{
            self.layer.shadowOffset = newValue
            
        }
    }
    
    @IBInspectable var shadowColor:UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.clear.cgColor)
        }
        
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    
    func setUpShadows(mask: CAShapeLayer){
        self.layer.masksToBounds = false
        self.layer.shadowPath = mask.path
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    //MARK:- B - UIImageview
    //MARK:- Usage -> view.setSpecificRoundCorners([.topLeft, .bottomLeft], radius: 10)
    //Default Border Color and Width are set.
    func setSpecificRoundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.bounds
        borderLayer.path = mask.path
        borderLayer.lineWidth = CGFloat(self.borderWidth)
        borderLayer.strokeColor = self.borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(borderLayer)
        setUpShadows(mask: mask)
        
    }
    
}


/// view
 class BaseView:UIView{
    var currentCornerRadius:Float?
    
    //MARK:- A - UIView
    
    @IBInspectable var cornerRadius:Float{
        get{
            return Float(self.layer.cornerRadius)
        }
        set{
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderWidth:Float{
        get{
            return Float(self.layer.borderWidth)
        }
        set{
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }else{
                return UIColor.clear
            }
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    
    @IBInspectable var roundCorners:Bool{
        get{
            return self.roundCorners
        }
        set{
            self.currentCornerRadius = Float(self.layer.cornerRadius)
            if newValue{
                self.layer.cornerRadius = self.frame.width/2
            }else{
                self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
            }
        }
    }
    
    @IBInspectable var shadowOffset:CGSize{
        get{
            let currentOffset = self.layer.shadowOffset
            // let offset:(width:Int,height:Int) = (Int(currentOffset.width),Int(currentOffset.height))
            return currentOffset
        }
        set{
            self.layer.shadowOffset = newValue
            
        }
    }
    
    @IBInspectable var shadowColor:UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.clear.cgColor)
        }
        
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity:Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
        
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    
    func setUpShadows(mask: CAShapeLayer){
        self.layer.masksToBounds = false
        self.layer.shadowPath = mask.path
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        layoutSubviews()
        
    }
    
    //MARK:- B - UIView
    //MARK:- Usage -> view.setSpecificRoundCorners([.topLeft, .bottomLeft], radius: 10)
    //Default Border Color and Width are set.
    func setSpecificRoundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
        let borderLayer = CAShapeLayer()
        borderLayer.frame = self.bounds
        borderLayer.path = mask.path
        borderLayer.lineWidth = CGFloat(self.borderWidth)
        borderLayer.strokeColor = UIColor.clear.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(borderLayer)
        setUpShadows(mask: mask)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.layoutSubviews()
    }

    
}



//MARK:- Gradient View

 class BaseGradientView: BaseView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var centerColor:   UIColor = .gray { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var centerLocation: Double =   0.5 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber,centerLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, centerColor.cgColor, endColor.cgColor]
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
        
    }
}


// TextView with no edge insets
 class UITextViewFixed: UITextView
{
    override func layoutSubviews()
    {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}

//MARK:- A - UILabel

 class BaseLabel: UILabel {
    
    var currentCornerRadius:Float?
    
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var roundCorners:Bool{
        get{
            return self.roundCorners
        }
        set{
            self.currentCornerRadius = Float(self.layer.cornerRadius)
            if newValue{
                self.layer.cornerRadius = self.frame.width/2
            }else{
                self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
            }
        }
    }
    
    @IBInspectable var borderWidth:Float{
        get{
            return Float(self.layer.borderWidth)
        }
        set{
            self.layer.borderWidth = CGFloat(newValue)
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }else{
                return UIColor.clear
            }
        }
        set{
            self.layer.borderColor = newValue.cgColor
            self.layer.masksToBounds = true

        }
    }


    @IBInspectable var leftSideBorder: Bool = false {
        didSet{
            updateSideBorder()
        }
    }
    @IBInspectable var rightSideBorder: Bool = false {
        didSet{
            updateSideBorder()
        }
    }
    @IBInspectable var topSideBorder: Bool = false {
        didSet{
            updateSideBorder()
        }
    }
    @IBInspectable var bottomSideBorder: Bool = false {
        didSet{
            updateSideBorder()
        }
    }
    @IBInspectable var sideColor:UIColor = .clear {
        didSet {
            updateSideBorder()
        }
    }
    @IBInspectable var sideThickness:CGFloat = 0.0 {
        didSet {
            updateSideBorder()
        }
    }
        
    func updateSideBorder(){
        let border = CALayer()
        border.backgroundColor = sideColor.cgColor
        
        if leftSideBorder{
             border.frame = CGRect(x: 0, y: 0, width: sideThickness, height: self.frame.height)
        }
        
        if rightSideBorder{
            border.frame = CGRect(x: frame.maxX, y: frame.minY, width: sideThickness, height: frame.height)
        }
        
        if topSideBorder {
            border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: sideThickness)
        }
        if bottomSideBorder {
            border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: sideThickness)
        }
        border.masksToBounds = false
        layer.masksToBounds = true
        layer.addSublayer(border)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSideBorder()
        layer.masksToBounds = true
        side()
    }
    
    
    @IBInspectable var blockColor: UIColor = UIColor.black {
        
        didSet{
            
          side()
        }
    }
    
    func side(){
        let border = CALayer()
        border.frame = CGRect(x: 0, y: 0, width: 15, height: self.frame.height)
        border.backgroundColor = blockColor.cgColor;
        
        self.layer.addSublayer(border)
    }
    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
}

// Mark: - Textfield
 class BaseTextField: UITextField {
    
     var currentCornerRadius:Float?
     
     
     @IBInspectable var cornerRadius:CGFloat = 0{
         didSet{
             layer.cornerRadius = cornerRadius
             layer.masksToBounds = cornerRadius > 0
         }
     }
     
     @IBInspectable var roundCorners:Bool{
         get{
             return self.roundCorners
         }
         set{
             self.currentCornerRadius = Float(self.layer.cornerRadius)
             if newValue{
                 self.layer.cornerRadius = self.frame.width/2
             }else{
                 self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
             }
         }
     }
     
     
    @IBInspectable var isSetBottomBorder: Bool = false {
        didSet {
            setBottomBorder()
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            self.layer.masksToBounds = false
            self.layer.shadowColor = BottomBorderColor.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: BottomBorderThick)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 0.0
        }
    }
    
    @IBInspectable var BottomBorderColor: UIColor = .lightGray {
        didSet {
            setBottomBorder()
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            self.layer.masksToBounds = false
            self.layer.shadowColor = BottomBorderColor.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: BottomBorderThick)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 0.0
        }
    }

    @IBInspectable var BottomBorderThick: CGFloat = 1.0 {
        didSet {
            //setBottomBorder(color: BottomBorderColor, thickness: newValue)
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            self.layer.masksToBounds = false
            self.layer.shadowColor = BottomBorderColor.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: BottomBorderThick)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 0.0
        }
    }

    func setBottomBorder() {
        if isSetBottomBorder {
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            self.layer.masksToBounds = false
            self.layer.shadowColor = BottomBorderColor.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: BottomBorderThick)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 0.0
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setBottomBorder()
    }
}


public class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            self.layer.borderWidth = 1
            self.borderStyle = .none
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderCornerRadius: CGFloat = 4 {
        didSet {
            self.layer.borderWidth = 1
            self.borderStyle = .none
            self.layer.cornerRadius = borderCornerRadius
        }
    }
    
    @IBInspectable var textPadding: CGFloat = 0 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: textPadding, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var startLocation: Double =   0.05 { didSet { updateLocations() }}
    @IBInspectable var endLocation:   Double =   0.95 { didSet { updateLocations() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { return CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? CGPoint(x: 0, y: 0) : CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? CGPoint(x: 1, y: 1) : CGPoint(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors    = [startColor.cgColor, endColor.cgColor]
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
    }
}

class DashedLineView : UIView {
    @IBInspectable var perDashLength: CGFloat = 2.0
    @IBInspectable var spaceBetweenDash: CGFloat = 2.0
    @IBInspectable var dashColor: UIColor = UIColor.lightGray
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width
            
        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)
            
            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }
        
        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        
        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }
    
    private var width : CGFloat {
        return self.bounds.width
    }
    
    private var height : CGFloat {
        return self.bounds.height
    }
}




@IBDesignable class BaseTextView: UITextView {
    
    var currentCornerRadius:Float?
    
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var roundCorners:Bool{
        get{
            return self.roundCorners
        }
        set{
            self.currentCornerRadius = Float(self.layer.cornerRadius)
            if newValue{
                self.layer.cornerRadius = self.frame.width/2
            }else{
                self.layer.cornerRadius = CGFloat(currentCornerRadius ?? 0)
            }
        }
    }
    
    @IBInspectable var _tintColor : UIColor? {
        get {
            return self._tintColor
        } set {
            self.tintColor = newValue
        }
    }
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        textContainer.lineFragmentPadding = 0
    }
    
    
    var _placeHolder : String = ""
    /// The UITextView placeholder text
    @IBInspectable var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                //self.addPlaceholder(newValue ?? "")
            }
        }
    }
    
    
    @IBInspectable var borderWidth:Float{
        get{
            return Float(self.layer.borderWidth)
        }
        set{
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            if let color = self.layer.borderColor{
                return UIColor(cgColor: color)
            }else{
                return UIColor.clear
            }
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            if self.text!.count > 0 {
                 placeholderLabel.removeFromSuperview()
            }
        } else if text.count == 0 {
          //addPlaceholder(_placeHolder)
          layoutSubviews()
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            self.textContainer.lineFragmentPadding = 0
            self.textContainerInset = UIEdgeInsets.zero
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
//    private func addPlaceholder(_ placeholderText: String) {
//        let placeholderLabel = UILabel()
//        _placeHolder = placeholderText
//        placeholderLabel.text = placeholderText
//        placeholderLabel.sizeToFit()
//
//        placeholderLabel.font = self.font
//        placeholderLabel.textColor = UIColor.lightGray
//        placeholderLabel.tag = 100
//
//        placeholderLabel.isHidden = self.text!.count>0
//
//        self.addSubview(placeholderLabel)
//        self.resizePlaceholder()
//        self.delegate = self
//    }
}

extension UIView {
    func cornerRadius(usingCorners corners:UIRectCorner,cornerRadii:CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
    }
}


//extension UIView {
//
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//         let mask = CAShapeLayer()
//         mask.path = path.cgPath
//         layer.mask = mask
//     }
//
//}
