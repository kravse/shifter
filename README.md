Background Shifter
===========

This is a little plugin that lets you add a rotating background to any div. This is not a user controlled slideshow, it's simply a rotating background. 

Instructions: 

1) In the project root, run 'npm install'

2) Run gulp to compile all static assets from 'src' into their build destinations. 

3) Optional: Run gulp watch to poll for changes. 


Setup the Background shifter

1) Include the shifter.js file. 

2) Add as many slides with the class .bg-shifter into any parent div. The shifter takes the height and width of the parent div, so you may need to style the parent appropriately. Each bg-shifter should have an inline style setting the background image. (i.e. <div style="background-image: url('../images/1.jpg');" class="bg-shifter"></div>)

3) Initialize the shifter using Shifter.shift(object, time)(i.e. Shifter.shift($('.test-box'), 6000); ) 