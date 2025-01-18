tiempo = xlsread('D:\\Users\ACER\Desktop\Semestre 9\Contro Robotico\Entrega 2\Calculos Robotica entrega 2,1.xlsx','B1:B479');
velocidad = xlsread('D:\\Users\ACER\Desktop\Semestre 9\Contro Robotico\Entrega 2\Calculos Robotica entrega 2,1.xlsx','A1:A479');
t=tiempo; y=velocidad;
datos = iddata(y,t,2.4)
datos=iddata(y, t, 0.005) %muestreo cada 10mS