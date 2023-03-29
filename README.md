# ReviewComputerGraphicsAssignment
 Task 1:
 Forward rendering: Calculates the light for a single pass for each object individually. Depending on the number of light sources this could have to happen multiple times
![image](https://user-images.githubusercontent.com/91763901/228612854-429ff5a8-5736-47bb-a6b6-0772a242e3a5.png)
Deferred rendering: This renders the material on every visible object in the scene at once. Then take each material and process each pixels lighting individually
![image](https://user-images.githubusercontent.com/91763901/228613270-6ad454a4-0c89-459d-a434-fa83bf1e72c5.png)

Task 2:


Task 3:
It gives it a old pixely feel to it. 



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

Task 6:
