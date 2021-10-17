# TomatoProgressThreeColors Framework

![](Screenshots/Screenshot_001.jpg)

<h2>Development and compatibility</h2>

Development platform: iOS<br/>
Language: Swift<br/>
Compatibility: iOS 11 or greater<br/>

<h2>Description</h2>

TomatoProgressThreeColors lets you run a simple, circular, customizable progressive wheel with three colors of your selection.  You have options of showing or not showing a button for aborting progress on top of a number of other settings like the speed of rotation.

<h2>Using TomatoProgressThreeColors</h2>

In order to use this framework, download the sample project.  You will find the folder titled 'TomatoProgressThreeColorsFramework.'  Locate the Xcode file inside.  And put this Xcode file in your Xcode project.  Select your target and make sure you have 'TomatoProgressThreeColorsFramework.framework' under General > Framworks, Libraries, and Embeded Content as shown below.

![](Screenshots/Screenshot_002.jpg)

<h2>Steps</h2>

Step 1: Import the framework to your Xcode project.<br/>
Step 2: Import TomatoProgressThreeColorsFramework to your view controller.<br/>
Step 3: In your view controller, create a blank UIView object whose frame is the same as that of view controller's view.<br/>
Step 4: When you are ready to run a 3-color progressive wheel, instantiate TomatoProgressThreeColorsView to create a UIView object.<br/>
Step 5: Add the UIView object in Step 4 to the blank UIView object in Step 3.<br/>
Step 6: Add the blank UIView object to view controller's view.<br/>
Step 7: If you need to take down the progress view, remove the blank UIView object from its super view.<br/>

<h2>Initial values</h2>

strokeColor0: Stroke Color 1<br/>
startDegree0: Starting degree (not in radians) stroke color 1<br/>
endDegree0: Ending degree (not in radians) stroke color 1<br/>
	
strokeColor1: Stroke Color 2<br/>
startDegree1: Starting degree (not in radians) stroke color 2<br/>
endDegree1: Ending degree (not in radians) stroke color 2<br/>
	
strokeColor2: Stroke Color 3<br/>
startDegree2: Starting degree (not in radians) stroke color 3<br/>
endDegree2: Ending degree (not in radians) stroke color 3<br/>
	
backColor: It's the background color of the pressive wheel UIView object.<br/>
radius: It's the radius of the progressive wheel.<br/>
weight: It's the stroke weight of the progressive wheel.<br/>
slowness: It's the speed at which the progressive wheel rotates.  The smaller the number is, the faster the wheel will rotate.<br/>
	
hasAbortButton: Set this boolean value to true if you want to show a button for aborting the progressive wheel.<br/>
abortTitle: It's the title of the abort button.<br/>
abortButtonHasBorder: It's the options of having or not having the border around the abort button.<br/>
abortButtonBorderColor: It's the border color around the abort button.<br/>
abortButtonBorderWidth: It's the border weight.<br/>
abortButtonCornerRadius: It's the corner radius of the abort button.<br/>
abortButtonSize: It's the abort button size.<br/>
abortBackColor: It's the background color of the abort button.<br/>
abortTitleNormalColor: It's the title color the abort button for the normal state.<br/>
abortTitleHighlightedColor: It's the title color the abort button for the highlighted state.<br/>

<h2>Notes</h2>
1. The wheel stroke values must be continuous, or the framework won't show a progessive wheel, and you will see a console message that says 'Wrong degrees!.'  That is, endDegree0 must equal startDegree1, and endDegree1 must equal startDegree2.  Additionally, the summation of the absolute values of start and end degree numbers must equal 360.
