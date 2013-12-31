DoAlertView
===========

An replacement for UIAlertView : block-based, customizable theme, easy to use with image or map

## Preview

### with title, with yes button, with no button
![DoAlertView Screenshot](https://raw.github.com/donobono/DoAlertView/master/p1.png)

### without title, with yes button, with no button, with an image, destructive mode
![DoAlertView Screenshot](https://raw.github.com/donobono/DoAlertView/master/p2.png)

### without title, with only yes button, with a map
![DoAlertView Screenshot](https://raw.github.com/donobono/DoAlertView/master/p3.png)


## Requirements
- iOS 7.0 and greater
- ARC


## Examples

**Code:**

```objc

_vAlert = [[DoAlertView alloc] init];
// required
_vAlert.nAnimationType = _sgType.selectedSegmentIndex;	// there are 5 type of animation

// optional
_vAlert.dRound = 2.0;
_vAlert.bDestructive = NO;	// for destructive mode

// with image
_vAlert.iImage = [UIImage imageNamed:@"pic1.jpg"];
_vAlert.nContentMode = DoContentImage;

// with map
_vAlert.nContentMode = DoContentMap;
_vAlert.dLocation = @{@"latitude" : @(37.78275123), @"longitude" : @(-122.40416442), @"altitude" : @200};

// launch with title, yes button and no button
[_vAlert doYesNo:@"Title"
            body:@"Here’s a snippet of code that illustrates how the whole process works"
             yes:^(DoAlertView *alertView) {
              
                 NSLog(@"Yeeeeeeeeeeeees!!!!");

             } no:^(DoAlertView *alertView) {

                 NSLog(@"Noooooooooooooo!!!!");
               
             }];


// launch with only yes button
_vAlert.bDestructive = YES;
[_vAlert doYes:@"Here’s a snippet of code that illustrates how the whole process works"
           yes:^(DoAlertView *alertView) {
               
               NSLog(@"Yeeeeeeeeeeeees!!!!");
               
           }];

// launch with timer, without any buttons
[_vAlert doAlert:@"Please wait a second!"
            body:@"Getting great data from server..."
        duration:0.0
            done:^(DoAlertView *alertView) {
                
                NSLog(@"Done!!!!");
                
            }];

```

```objc
// customizable theme
#define DO_TITLE_BOX                DO_RGB(218, 247, 244)
#define DO_NORMAL_BOX               DO_RGB(255, 255, 255)
#define DO_BUTTON_BOX               DO_RGB(13, 52, 85)
#define DO_DESTRUCTIVE_BOX          DO_RGB(236, 90, 73)
#define DO_TEXT_COLOR               DO_RGB(13, 52, 85)
#define DO_DESTRUCTIVE_TEXT_COLOR   DO_RGB(255, 255, 255)
#define DO_DIMMED_COLOR             DO_RGBA(0, 0, 0, 0.7)

#define DO_TEXT_FONT        [UIFont fontWithName:@"Avenir-Medium" size:14]
#define DO_BOLD_FONT        [UIFont fontWithName:@"Avenir-Heavy" size:14]

#define DO_LABEL_INSET      UIEdgeInsetsMake(10, 10, 10, 10)
#define DO_TITLE_INSET      UIEdgeInsetsMake(5, 10, 5, 10)
#define DO_VIEW_WIDTH       280

```

## Credits

DoAlertView was created by Dono Cho.


## License

DoAlertView is available under the MIT license. See the LICENSE file for more info.
