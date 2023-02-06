# Graphics Assingment1
 
I am making a checklist for each part and under the checkmark I give it, I am explaining it

# Part 1
- [X] Dynamic Game Object
 My dynamic game object was a sphere that rotated around consistently. Now the way I coded this was just by multiplying the rotation speed by the time.delta time along with a pivot point that is rotates around

- [X] Playable character
I made the camera a child of the player, and then created a movement script (WASD) to move and using your mouse to look around. I also added gravity after realizing I could literally fly by looking up and pressing W

- [X] Pleasing scene
I made a maze scene for the player

- [X] Win Condition
The win condition occurs when you find the green cube. I made code for this to occur using text on screen

- [X] Lose Condition
Lose condition occurs when you get hit by the moving sphere three times.  I made code for this to occur using text on screen. This code also holds the code for the on-screen text.



# Part 2
- [X] shader one: Specular
I used the shader from the lecture
How it works: This shader creates more of a reflection like look, allowing for really cool outputs in looks wise. It has 3 properties. One being the color, one being the metallic texture and the last being the specular lighting color. The albedo is the color, then the tex2D is multiplied by the metallic texture and also by the uv.metallic texture. THis deterimes how smooth it will look. Then the specular relfection strength and color is generated

- [X] shader two: Lambert
I used the shader from the lecture
How it works: It takes in the surface output, the direction of the incoming light, and the light's intensity. Then the dot product of the surface normal and the imcoming light direction is calculated, using the result to scale the imcoming light intensity.  

I created code so that you are able to switch back and forth from each one while in play mode within unity. Press "1" to use specular and "2" to use lambert. They are both used on the floor.



# Part 3
- [X] All three Lut shaders

First, I went into photoshop to find the cool, warm and custom lut shadings that I was looking to implement into my game. I found them all and by using the code that i retreived from the lecture, I was able to grab the shader and move on from there. I made three materials, each one representing the warm, cool or custom. Then made a script in unity that allowed me to press "4", for cool shading, "5" for warm shading, "6" for my custom lut shading and finally "3" for you to be able to go back to the original shade that you were at previous. This last "3" button allows the user to go back to what the game looked like before the environment was changed by the lut shader. I then applied this code to the camera, and I put these three materials into the available slots so that they can be of use and work. All three of these use the lut shader from class but have different luts as I grabbed them each from photoshop. 

How the lut shader works: There are three properties, two of which are textures. The first texture is the main texture that provides the look and color you mainly want it to be. Then the LUT texture is there for you to input the LUT you would like to be integrated into the scene. Finally the contribution parameter controls the degree of which the LUT is applied to. Where the saturate function occurs, it takes the colors value and ensures it stays within the range of 0 to 1. The LUT position gets then calculated by using RGB components of the input color and then the color correction is performed by lerping the orginal color and the new color based on the value of the contribution.



# Part 4
- [X] Additional Shader #1: Rim Lighting
How it works: It has two properties, rimPower and rimColor. It finds the dot product of the surface normal and view direction, then subtracting that result by 1. That gets the rim effect. Then this value is brought up to the power of the rimPower controlling the rim effects intensity. 

I added the rim lighting shader to a material and that matieral to the flying ord/sphere

- [X] Additional Shader #2: Bump Diffuse
How it works: This shader takes two textures as imputs and uses a sampler 2D to sample the color information from both of them. The diffuse texture provides the base color information which is the albedo value and the myBump texture provides the surface normal information and is used to add the illusion of bumpy-ness to the surface. The mySlider then is able to control the intensity of how bumpy the surface will be. 

I added the bump diffuse shader to a material, and that material onto the outer tall walls 

# Video Report is in a folder called "Video Report"
