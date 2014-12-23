//
//  BLShareView.swift
//  BLShareController
//
//  Created by Benny Lach on 22.12.14.

//  The MIT License (MIT)

//  Copyright (c) 2014 Benny Lach

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.



import UIKit

extension UIColor {
    
    class func customLightGray()->UIColor {
        return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    class func customDarkGray()->UIColor {
        return UIColor(red: 45/255, green: 45/255, blue :45/255, alpha: 1)
    }
    
    class func fbColor()->UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
    }
    class func twColor()->UIColor {
        return UIColor(red: 89/255, green: 173/255, blue: 235/255, alpha: 1)
    }
    class func waColor()->UIColor {
        return UIColor(red: 59/255, green: 173/255, blue: 47/255, alpha: 1)
    }
}

// Delegate Protocol
protocol BLShareDelegate {
    
    func shareOnFaceBook()
    func shareOnTwitter()
    func shareOnWhatsApp()
    func shareViaMail()
    func ShareViaSMS()
    func close()
}

class BLShareView: UIView {
    
    var shareDelegate:BLShareDelegate?
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let btnFont:UIFont = UIFont(name: "HelveticaNeue-Bold", size: 16)!
        let lblFont:UIFont = UIFont(name: "HelveticaNeue-Ultralight", size: 30)!
        
        let effect:UIVisualEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurView = UIVisualEffectView(effect: effect)
        blurView.frame = frame
        
        self.addSubview(blurView)
        
        let txtLabel = UILabel(frame: CGRectMake(30, 40, frame.size.width - 60, lblFont.lineHeight))
        txtLabel.textColor = UIColor.customLightGray()
        txtLabel.textAlignment = NSTextAlignment.Center
        txtLabel.numberOfLines = 1
        txtLabel.font = lblFont
        txtLabel.text = "SHARE"
        
        self.addSubview(txtLabel)
        
        // Facebook Button
        let fbBtn = UIButton(frame: CGRectMake(30, txtLabel.frame.origin.y + txtLabel.frame.size.height + 40, frame.size.width - 60, 50))
        fbBtn.addTarget(self, action: Selector("shareOnFacebook:"), forControlEvents: UIControlEvents.TouchUpInside)
        fbBtn.setTitleColor(UIColor.customLightGray(), forState: UIControlState.Normal)
        fbBtn.setTitle("Facebook", forState: UIControlState.Normal)
        fbBtn.titleLabel?.textAlignment = NSTextAlignment.Center
        fbBtn.titleLabel?.numberOfLines = 1
        fbBtn.titleLabel?.font = btnFont
        fbBtn.backgroundColor = UIColor.fbColor()
        fbBtn.alpha = 0.6
        
        self.addSubview(fbBtn)
        
        // Twitter Button
        let twBtn = UIButton(frame: CGRectMake(30, fbBtn.frame.origin.y + 60, frame.size.width - 60, 50))
        twBtn.addTarget(self, action: Selector("shareOnTwitter:"), forControlEvents: UIControlEvents.TouchUpInside)
        twBtn.setTitleColor(UIColor.customLightGray(), forState: UIControlState.Normal)
        twBtn.setTitle("Twitter", forState: UIControlState.Normal)
        twBtn.titleLabel?.textAlignment = NSTextAlignment.Center;
        twBtn.titleLabel?.numberOfLines = 1
        twBtn.titleLabel?.font = btnFont;
        twBtn.backgroundColor = UIColor.twColor()
        twBtn.alpha = 0.6
        
        self.addSubview(twBtn)
        
        // WhatsApp Button
        let waBtn = UIButton(frame: CGRectMake(30, twBtn.frame.origin.y + 60, frame.size.width - 60, 50))
        waBtn.addTarget(self, action: Selector("shareOnWhatsApp:"), forControlEvents:UIControlEvents.TouchUpInside)
        waBtn.setTitleColor(UIColor.customLightGray(), forState: UIControlState.Normal)
        waBtn.setTitle("WhatsApp", forState: UIControlState.Normal)
        waBtn.titleLabel?.textAlignment = NSTextAlignment.Center
        waBtn.titleLabel?.numberOfLines = 1
        waBtn.titleLabel?.font = btnFont
        waBtn.backgroundColor = UIColor.waColor()
        waBtn.alpha = 0.6
        
        self.addSubview(waBtn)
        
        // Mail Button
        let mailBtn = UIButton(frame: CGRectMake(30, waBtn.frame.origin.y + 60, frame.size.width - 60, 50))
        mailBtn.addTarget(self, action: Selector("shareViaMail:"), forControlEvents:UIControlEvents.TouchUpInside)
        mailBtn.setTitleColor(UIColor.customDarkGray(), forState: UIControlState.Normal)
        mailBtn.setTitle("Email", forState: UIControlState.Normal)
        mailBtn.titleLabel?.textAlignment = NSTextAlignment.Center
        mailBtn.titleLabel?.numberOfLines = 1
        mailBtn.titleLabel?.font = btnFont
        mailBtn.backgroundColor = UIColor.whiteColor()
        mailBtn.alpha = 0.6
        
        self.addSubview(mailBtn)
        
        // SMS Button
        let smsBtn = UIButton(frame: CGRectMake(30, mailBtn.frame.origin.y + 60, frame.size.width - 60, 50))
        smsBtn.addTarget(self, action: Selector("shareViaSMS:"), forControlEvents: UIControlEvents.TouchUpInside)
        smsBtn.setTitleColor(UIColor.customDarkGray(), forState: UIControlState.Normal)
        smsBtn.setTitle("SMS", forState: UIControlState.Normal)
        smsBtn.titleLabel?.textAlignment = NSTextAlignment.Center
        smsBtn.titleLabel?.numberOfLines = 1
        smsBtn.titleLabel?.font = btnFont
        smsBtn.backgroundColor = UIColor.whiteColor()
        smsBtn.alpha = 0.6
        
        self.addSubview(smsBtn)
        
        // Close Button
        let cancelBtn = UIButton(frame: CGRectMake(0, 0, 25, 25))
        cancelBtn.addTarget(self, action: Selector("close:"), forControlEvents: UIControlEvents.TouchUpInside)
        cancelBtn.setBackgroundImage(UIImage(named: "close.png"), forState :UIControlState.Normal)
        cancelBtn.center = CGPointMake(frame.size.width / 2,frame.size.height - 40);
        
        self.addSubview(cancelBtn)
    }
    
    func shareOnFacebook(sender: AnyObject) {
        shareDelegate?.shareOnFaceBook()
    }
    
    func shareOnTwitter(sender: AnyObject) {
        shareDelegate?.shareOnTwitter()
    }
    
    func shareOnWhatsApp(sender: AnyObject) {
        shareDelegate?.shareOnWhatsApp()
    }
    
    func shareViaMail(sender: AnyObject) {
        shareDelegate?.shareViaMail()
    }
    
    func shareViaSMS(sender: AnyObject) {
        shareDelegate?.ShareViaSMS()
    }
    
    func close(sender: AnyObject) {
        shareDelegate?.close()
    }
    
}
