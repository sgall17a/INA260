from machine import I2C,Pin
from ina260 import INA260
import time

i2c=I2C(0,sda=Pin(16),scl=Pin(17))

print(i2c.scan())

ina = INA260(i2c)

while True:
    print(ina.voltage(), ina.current(), ina.power())
    time.sleep(1)
