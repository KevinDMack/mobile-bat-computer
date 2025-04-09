# mobile-bat-computer


To Do:
----------------------------------------------------------------------------------
1. Migrate all code to git repo.
2. Build out workflow for building flashlight container for github
3. Remove flashlight from action panel, and make it always running container
4. Break classes out into separate objects for flashlight and control panel
5. Build startup service to enable action panel
    5.1. Build out startup with flashlight pod enabled.
    5.2. Build out action panel as a container that gets deployed
    5.3. Remove logic that does subprocess and instead enable dapr message to trigger
6. Build out new applications to provide support for interface.
7. Migrate dispatch screen to raspberry pi 4 for execution, and move logic into docker container
