from gpiozero import Button, LED 
from signal import pause

class Flashlight:
    def __init__(self, led_pin, button_pin):
        self.led = LED(led_pin)
        self.button = Button(button_pin)

        self.button.when_pressed = self.led.on
        self.button.when_released = self.led.off

    def run(self):
        print("Flashlight app is running")
        pause()

if __name__ == "__main__":
    print("Flashlight app started")
    print("Setting up GPIO pins")
    flashlight = Flashlight(led_pin=26, button_pin=4)
    flashlight.run()