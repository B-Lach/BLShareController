BLShareController
=================

Based on an image I´ve found on [Dribbble](https://dribbble.com/shots/1708543-Share-Screen-IOS) I wanted something similiar for a project I was working on.
 
BLShareController is able to share things via:

* Facebook
* Twitter
* WhatsApp
* Mail
* SMS


To play around a little bit with Swift I´ve refactored it. 


##How it works

First, you have to implement the BLPresentationDelegate protocol, initialize the class and set the presentationDelegate

```
class ViewController: UIViewController,BLPresentationDelegate {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let shareController = BLShareController()
		shareController.presentationDelegate = self
		
		self.view.addsubView(shareController.view)
		
	}
}
```

Don`t forget to implement the functions for the delegate protocol

```
class ViewController: UIViewController, BLPresentationDelegate {
	
	....
	
	func presentController(controller: UIViewController) {
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    func dismissController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
```

If you like to share a specific text you can set it that way:

```
shareController.initialText = "Your initial text you want to share"
```

The example project should be clear enough. Have fun
