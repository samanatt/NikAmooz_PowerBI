import serial


port = 'COM3'  # پورت مربوط به ترازو
baudrate = 9600 


with serial.Serial(port, baudrate) as ser:
    while True:
        if ser.in_waiting > 0:
            data = ser.readline().decode('utf-8').strip()
            print(data) 
