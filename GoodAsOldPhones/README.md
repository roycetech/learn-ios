Overview
--------

This project is created from CodeSchool course.


Features:
---------

- Using scroll views to display content larger than the phone screen.
- Using class to pass multiple data to another view
- Retrieve the cell tapped on `prepare(for: seque)` 



How to play UI views outside of the default size 
------------------------------------------------

1. Drag the scroll view outside of the main view.  This will make the main view display the scroll view above the main view.
2. Resize the scroll view to the desired height, take note of this height.
3. Add the contents.
4. Create an outlet for the scroll view and add this the the main view on `viewDidLoad`
5. Override the function `viewWillLayoutSubviews()` and set the scroll view `contentSize` to CGSizeMake(width, height).  Height and width are the ones set in step 2.


How to transition to detail page upon row selection
---------------------------------------------------

1. Embed the Product List view inside a navigation controller
2. In the document outline, select the cell and then choose the connections navigator in the right panel.
3. From the (+), control drag to the target screen.


