BLShareController
=================

Based on an image I´ve found on [Dribbble](https://dribbble.com/shots/1708543-Share-Screen-IOS) I wanted something similiar for a project I was working on.

To play around a little bit with Swift I´ve refactored it. 
 
BLShareController is able to share things via:

* Facebook
* Twitter
* WhatsApp
* Mail
* SMS

##How it works

Initialize the class and make it a subview of your viewController

```
class ViewController: UIViewController {
	
	let shareController = BLShareController()
	...
	
	func btnPressed() {
		self.view.addSubview(self.shareController.view)
	}
```

If you want to set a specific initial text:

```
shareController.initialText = "Your initial text you want to share"
```

The example project should be clear enough. Have fun

