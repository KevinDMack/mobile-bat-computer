# Mobile-Bat-Computer - Mobile Cyberdeck Computer

The current project is to build a fore-arm mounted or holstered cyberdeck.  The goal is to have a mobile computer that can be used on the move.  

# Hardware:

Currently the plan is to build a cyberdeck using a k3s running on a Raspberry Pi.  

# Functionality:

The goal of this is to build out arm-mounted utility for part of a batman costume.  

To that end, the goal is that it will provide the following:

1. **Flashlight** - This should be to provide a flashlight on the side of the device. 
1. **Mycroft** - Should provide a mobile LLM for information.  
1. **Camera** - This camera should have an ability to have an attachment for a camera.
1. **Case Files** - There should be an option for pulling up case files.
1. **GCPD Dispatch** - Have integration with a realtime dispatch that shows calls as they are coming in.
1. **Map** - Build the ability to pull up a map with my current location.  

# To Do:

The following are the main to-do items. 

## Deployment Automation
1. Build out github workflow for building the container image for flashlight app to push to github.

## Control Panel
1. Update control panel to send dapr messages and not deploy container apps.
2. Break out class into separate file / module
3. Remove flashlight from Control-panel

## Device
1. Build out startup service to enable action panel, and flashlight

## Flashlight
1. Break out class into separate file / module

## Dispatch
1. Migrate dispatch screen to raspberry pi 4 for execution, and move logic into docker container
>>>>>>> Stashed changes
