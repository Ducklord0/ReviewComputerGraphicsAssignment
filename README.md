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
This is blurring. Progressive upsampling to be specific. 


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

A for loop used for iteration of downsampling
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



Task 5:
It colors the shadow
This makes a color for the shadow
ShadowColor("Shadow Color", Color) = (1,1,1,1)

Takes the normal of the light hitting the surface and getting the dot product. Then making it the maximum value it can. 
fixed diff = max(0, dot(s.Normal, lightDir));


c.rgb = s.Albedo * _LightColor0.rgb * (diff * atten * 0.5);

Adding the shadow color to the object and uses 1-atten to tell how dark or light it is. 
c.rgb += _ShadowColor.xyz * (1.0 - atten);
c.a = s.Alpha;

This could be used as a cartoon shader to make it have unique colors or you could change it to add textures to make it able to have texture on the shadow. 

Task 6:
I implemented the shadow shader on the mast of the ship
This can be used on the objects on the surface of the water to get a cool moving shadow on the moving water
