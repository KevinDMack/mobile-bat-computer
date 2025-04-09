from gpiozero import Button
from signal import pause

import subprocess

class ActionPanel:
    def __init__(self, flashlight_button_pin):
        self.flashlight_button = Button(flashlight_button_pin)
        self.flashlight_button.when_pressed = self.flash_light_on_button_pressed
        self.enabled = False 
        self.flashlight_yaml = "./yamls/flashlight.yaml"

    def flash_light_on_button_pressed(self):
        print("Flashlight Button pressed")
        if self.enabled:
            print("Flashlight Disabled")
            self.enabled = False
            self.delete()
        else:
            print("Button action disabled")
            print("Flashlight Enabled")
            self.enabled = True
            self.apply()

    def apply(self):
        print("Applying changes to the flashlight")
        result = subprocess.run(["kubectl", "apply", "-f", self.flashlight_yaml], capture_output=True, text=True)
        if result.returncode == 0:
            print("Successfully applied the manifest:")
            print(result.stdout)
        else:
            print("Error applying the manifest:")
            print(result.stderr)

    def delete(self):
        print("Deleting the flashlight")
        result = subprocess.run(["kubectl", "delete", "-f", self.flashlight_yaml], capture_output=True, text=True)
        if result.returncode == 0:
            print("Successfully deleted the manifest:")
            print(result.stdout)
        else:
            print("Error deleting the manifest:")
            print(result.stderr)

    def run(self):
        print("Action Panel is running")
        pause()

if __name__ == "__main__":
    print("Setting Action Panel GPIO pins")
    action_panel = ActionPanel(flashlight_button_pin=18)
    action_panel.run()