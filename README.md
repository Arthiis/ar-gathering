# Gathering Script for QBCore

Hey, thanks for downloading this resource,

This is a basic, gathering location based script that uses qb-core, qb-target and ps-inventory. It allows the user to 'gather' items from specific locations on the map. In this example I have used the farm in the north.
Each item you can gather can have a custom animation and custom drop rate. However, when adding to ps-inventory it does NOT stack. 


here's a few Q&A's 

1. What version of QBCore do I need to use?<br>
I used version 2.1.0 

2. Will you create a version for other systems like ESX or QBox?<br>
No

3. Will you support if I get any errors?<br>
No

4. What do I need?<bR>
This script uses QBCore and ox_target, it uses ps-inventory (https://github.com/Project-Sloth/ps-inventory) and highly recommend it. <br>

5. Will this work with other inventory scripts / targeting scripts? <br>
No.

6. Will you make this script work with other inventory scripts / targeting scripts? <br>
I mean... maybe? if the demand requires it?

7. Do I need any other scripts like ox_lib to run this? <br>
ox_target - https://github.com/overextended/ox_target<br>
ps-inventory - https://github.com/Project-Sloth/ps-inventory

9. Why is it free? <br>
It's not about the money. But if you feel like contributing, you could always buy me a Ko-fi ([https://ko-fi.com/arthiis](https://ko-fi.com/kyronarthiis))

10. With your examples, the script doesn't work. What have I done wrong?<br>
You also need to add the image of the item, I personally use - https://github.com/bitc0de/fivem-items-gallery/tree/main/images <br>add the images into ps-inventory/html/images  <br>
You will also need to add something like <br>"apple = { name = 'apple', label = 'Apple', weight = 100, type = 'item', image = 'apple.png', unique = false, useable = true, shouldClose = false, description = 'An apple'  }, " <br>to qb-core/shared/items.lua - please see ps-inventory docs if you want to add decay to your food.
