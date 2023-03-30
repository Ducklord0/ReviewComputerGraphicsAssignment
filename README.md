# ReviewComputerGraphicsAssignment
 Task 1:
 Forward rendering: Calculates the light for a single pass for each object individually. Depending on the number of light sources this could have to happen multiple times
![image](https://user-images.githubusercontent.com/91763901/228612854-429ff5a8-5736-47bb-a6b6-0772a242e3a5.png)
Deferred rendering: This renders the material on every visible object in the scene at once. Then take each material and process each pixels lighting individually
![image](https://user-images.githubusercontent.com/91763901/228613270-6ad454a4-0c89-459d-a434-fa83bf1e72c5.png)

Task 2:
The water shader takes tex coordinates and edits their heigh based on the amplitude set. The amount that it happens over the texture depends on the frequency and the waves move using Time function implemented in unity and multiplying it by speed. 
![image](https://user-images.githubusercontent.com/91763901/228621502-d22f01cf-2445-4e8b-b2b4-538c3decfd8c.png)


Task 3:
This is blurring with progressive upsampling to be specific. 


Gets the size of the screen
int width = source.width / integerRange;
int height = source.height / integerRange;
RenderTextureFormat format = source.format;
RenderTexture[] textures = new RenderTexture[16];

Current destination
RenderTexture currentDestination = textures[0] = RenderTexture.GetTemporary(width, height, 0, format);

Used for the final blit and then releases it
Graphics.Blit(source, currentDestination);
RenderTexture currentSource = currentDestination;
Graphics.Blit(currentSource, destination);
RenderTexture.ReleaseTemporary(currentSource);

A for loop used for iteration of downsampling the screen width and height and stores it in an array
int i = 1;
for (; i < iterations; i++) {
width /= 2;
height /= 2;
currentDestination = textures[i] =
RenderTexture.GetTemporary(width, height, 0,
format);

Breaks if its not big enough
if (height < 2) {
break;
}

Renders every side twice and stores it in an array
![image](https://user-images.githubusercontent.com/91763901/228685262-4e644990-3ba5-4295-8499-f708532a0c73.png)


Task 4:
Shadow
I added the ability to make shadows appear as a chosen color on specific objects. 
I simply added a shadow color to the shader shader then got the secondshadow pass and multiplied it by the color. 
![image](https://user-images.githubusercontent.com/91763901/228713360-d2a374be-fa12-4b12-974d-c513f0ee11f4.png)
![image](https://user-images.githubusercontent.com/91763901/228713289-cb044b0d-1cde-447f-a9b7-eb6a1f859200.png)


Outline
I added a second layer to the outline that can have its color altered. 
We made a second color at the start and made a second pass for the second layer. I turned off the zbuffer on and off to get it behind the object and doesnt affect the object.
I divided the width of the outline by 2 so its always half of the outer outlines length. 
![image](https://user-images.githubusercontent.com/91763901/228713080-d4ea1cb0-ea6b-4bca-9c56-3d41526ac329.png)
![image](https://user-images.githubusercontent.com/91763901/228713231-3f2aafef-a475-47a9-9df5-cf6532242637.png)


Task 5:
It colors the shadow
This makes a color for the shadow
ShadowColor("Shadow Color", Color) = (1,1,1,1)

Takes the normal of the light hitting the surface and getting the dot product. Then making it the maximum value it can. 
fixed diff = max(0, dot(s.Normal, lightDir));


c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 0.5);

Adding the shadow color to the object and uses 1-atten to tell how dark or light it is depending on the distance from the light source. 
c.rgb += _ShadowColor.xyz * (1.0 - atten);
c.a = s.Alpha;

This could be used as a cartoon shader to make it have unique colors or you could change it to add textures to make it able to have texture on the shadow. 

Task 6:

