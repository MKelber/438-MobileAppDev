What you implemented

I implemented an extra condition to play. In the original design, the happiness bar could only go up and not down. I implemented a way where if the pet's hunger is below 40% and you play with them, it will decrease the happiness by an increment. 

How you implemented it

I implemented the happiness level part with just a few if statements in the play() function and also made sure the display bars only go down if the respective value is less than 10. If happiness or fullness is over 10, the value goes up or down until the value reaches 10 then the bar begins to decrease.


Why you implemented it 

I implemented this so to create a more balanced feel. Your pet must be mostly full if they are going to enjoy playing as a hungry animal will not enjoy being played with because the only thing on its mind would be food. I added the decrease from 10 to create a sense of urgency and also to serve as a visual change the player will almost certainly see if they hadn't noticed the numbers ticking down too far.