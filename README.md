
![ezgif com-gif-maker (2)](https://user-images.githubusercontent.com/29371886/123751118-2ed2c580-d8d9-11eb-885f-822a40ea32e8.gif)
![ezgif com-gif-maker](https://user-images.githubusercontent.com/29371886/124223048-c9731480-db24-11eb-99c6-1cd9e211a744.gif)



    func animateTabBarChange(tabBarController: UITabBarController, to viewController: UIViewController) {
    
        let fromView: UIView = tabBarController.selectedViewController!.view
        let toView: UIView = viewController.view
        
        if fromView != toView{
            let viewSize = fromView.frame
            let scrollRight = controllerIndex > tabBarController.selectedIndex
            
            // Avoid UI issues when switching tabs fast
            
            fromView.superview?.addSubview(toView)
            
            let screenWidth = UIScreen.main.bounds.size.width
            toView.frame = CGRect(x: (scrollRight ? screenWidth : -screenWidth), y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            
            UIView.animate(withDuration: 0.3, delay: TimeInterval(0.0), options: [.curveEaseOut, .preferredFramesPerSecond60], animations: {
                fromView.frame = CGRect(x: (scrollRight ? -screenWidth : screenWidth), y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
                toView.frame = CGRect(x: 0, y: viewSize.origin.y, width: screenWidth, height: viewSize.size.height)
            }, completion: { [self] finished in
                if finished {
                    fromView.removeFromSuperview()
                    tabBarController.selectedIndex = controllerIndex
                }
            })
        }
        
        /*
         if fromView != toView {
         
         UIView.transition(from: fromView, to: toView, duration: 0.8, options: .transitionCrossDissolve) { (finished) in
         
         // do whatever animation you like
         }
         }
         */
    }
