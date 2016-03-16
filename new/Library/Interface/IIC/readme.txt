Description:
.generate iic signals. Using OV7670 Camera as I2C testbench

Interface:
.iCLK :iic clock input(25MHz)
.rst  :reset signal, when rst is '1', reset
.I2C_SCLK : iic clock output	
.I2C_SDAT : iic data  output
.LUT_INDEX: iic register's address output
.LUT_DATA : iic register's data input	
.Slave_Addr: slave address input	