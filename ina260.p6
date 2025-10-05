#Extremely basic Micropython class for an INA260 voltage and current monitor 

class INA260:
    def __init__(self,i2c,id=64):
        self.i2c = i2c
        self.id = id
        
    def get_reg(self,register):
        buff=self.i2c.readfrom_mem(self.id,register,2)
        return int.from_bytes(buff,'big')
         
    def voltage(self):
        return self.get_reg(2) * 0.00125

    def current(self):
        curr = self.get_reg(1)
        if curr & (1<<15):
            curr -= (1<<16)
        return curr * 0.00125
    
    def power(self):
        return self.get_reg(0x3) *0.010

