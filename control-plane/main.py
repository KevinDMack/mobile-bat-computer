from gpiozero import Button
from signal import pause
from utils.flashlight import Flashlight

import subprocess

class ActionPanel:
    def __init__(self, flashlight_button_pin, led_pin):
        self.enabled = False 
        self.flashlight_yaml = "./yamls/flashlight.yaml"
        self.flashlight = Flashlight(led_pin=led_pin, button_pin=flashlight_button_pin)
        self.flashlight.run()

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

if __name__ == "__main__":
    flashlight_button_pin = 26
    led_pin = 4
    print("Setting Action Panel GPIO pins")
    action_panel = ActionPanel(flashlight_button_pin, led_pin)
    action_panel.run()