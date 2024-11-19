# How To Run
1. Install a live server extension in VS code [marketplace](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) (or can use any external live server library)
2. ```npm run build-tailwind``` (build tailwind CSS to ```/assets/tailwind.css``` based on all ```.html``` files in project)
3. Run the live server extension on any ```.html``` file you working on (for example ```src/records-overview/index.html```)
4. Normaly you'd run ```npm run build-tailwind``` on every html changes to re-generate the CSS or else the styling might not work

# Notes When Deploying
1. ```/assets``` folder should be moved to OTCS support folder (```OTCS/support/dashboard-widgets/assets```)
2. Before deploying make sure to change the url for CSS and JS inside the ```.html``` file to the corresponding path
 

This is the correct path in production (if the ```assets``` folder in OTCS is ```.../support/dashboard-widgets/assets```)

index.html
```
<link href="[LL_REPTAG_SUPPORTDIR /]dashboard-widgets/assets/tailwind.css" rel="stylesheet">
<link href="[LL_REPTAG_SUPPORTDIR /]dashboard-widgets/assets/fontawesome.css" rel="stylesheet">
<script src="[LL_REPTAG_SUPPORTDIR /]dashboard-widgets/assets/chart.js"></script>

```