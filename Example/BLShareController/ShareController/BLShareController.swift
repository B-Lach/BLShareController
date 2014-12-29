//
//  BLShareController.swift
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
import Social
import MessageUI

class BLShareController: UIViewController, BLShareDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    var initialText:String = "BLShareController works"
    
    required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
    override init() {
        super.init(nibName: nil, bundle: nil)
        
        let shareView = BLShareView(frame: UIScreen.mainScreen().bounds)
        shareView.shareDelegate = self
        
        self.view.addSubview(shareView)
    }
    
    // MARK: - BLShareViewDelegate
    func shareOnFaceBook() {
        
        let fbComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        fbComposer.setInitialText(self.initialText)
        
        self.presentController(fbComposer)
    }
    
    func shareOnTwitter() {
        
        let tweetComposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        tweetComposer .setInitialText(self.initialText)
        
        self.presentController(tweetComposer)
    }
    
    func shareOnWhatsApp() {
        
        let messageURL = NSURL(string: ("whatsapp://send?text=" + self.initialText).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        if UIApplication.sharedApplication().canOpenURL(messageURL!) {
            UIApplication.sharedApplication().openURL(messageURL!)
        } else {
            let alertView = UIAlertView(title: "Sorry", message: "You have to install WhatsApp first", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func shareViaMail() {
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.setMessageBody(self.initialText, isHTML: false)
        mailComposer.mailComposeDelegate = self
        
        self.presentController(mailComposer)
    }
    
    func ShareViaSMS() {
        
        let smsComposer = MFMessageComposeViewController()
        smsComposer.body = self.initialText
        smsComposer.recipients = nil
        smsComposer.messageComposeDelegate = self
        
        self.presentController(smsComposer)
    }
    
    func close() {
       self.view.removeFromSuperview()
    }
    
    // MARK: MFMailCompseViewControllerDelegate
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        
        if error != nil {
            println("MailComposeError: " + error.localizedDescription)
        }
        
        switch result.value {
            case MFMailComposeResultCancelled.value:
            println("mail was canceled");
        case MFMailComposeResultSent.value:
            println("sent mail")
        case MFMailComposeResultSaved.value:
            println("saved mail as draft")
        case MFMailComposeResultFailed.value:
            println("sending mail failed")
        default:
            println("unexpected result")
        }
        self.dismissController()
    }
    
    // MARK: - MFMessageCompseViewControllerDelegate
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        
        switch result.value {
        case MessageComposeResultCancelled.value:
            println("message waas canceled")
        case MessageComposeResultSent.value:
            println("sent message")
        case MessageComposeResultFailed.value:
            println("sending message failed")
        default:
            println("unexpected result")
        }
        self.dismissController()
    }
    
    func presentController(controller: UIViewController) {
        
        let delegate = UIApplication.sharedApplication().delegate
        delegate?.window!?.rootViewController!.presentViewController(controller, animated: true, completion: nil)
    }
    
    func dismissController() {
        
        let delegate = UIApplication.sharedApplication().delegate
        delegate?.window!?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}