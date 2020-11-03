1. What you implemented

I implemented two different drawing tools, a pen and a marker, as well as a button that saves the current drawing. To switch between tools, just tap the icon of the corresponding tool at the top of the screen. To save your drawing, tap the "Save Drawing" button

2. How you implemented it

For the tools, I added two more buttons and have the active tool have an alpha value of 1 while the inactive tool has an alpha of 0.5. I added two bools to signal the width slider which calculation to make, and made a call to the width slider to ensure the tool changes immediately. 

For the save button, I added a button and added two permissions to enable the app to access the photo album. When the button is pressed, an alert pops up asking if it you would like to allow access to your photo album, pressing cancel does not take a screenshot and pressing ok takes a picture of the drawing space.

There was no more effort involved in implementing the different tools, the two buttons work pretty similarly to the color buttons other than ensuring the width changes immediately and an extra conditional in the width slider action. To implement the save button, I watched two YouTube videos to get an idea of what to do. After that it was rather simple to implement, though I did forget to change the permissions at first.

3. Why you implemented it 

I implemented the tool feature to give more control to the user. Being able to change between two different tools with variable width gives a lot more options on what to draw. I implemented the save button to enable the user to actually save a drawing they like instead of having to delete it when they want to draw something new. 