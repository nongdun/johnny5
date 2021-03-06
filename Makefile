CC = g++

TARGET = johnny5

SOURCES = ./src/main.cpp \
		./dev/src/mpu6050.cpp \
		./dev/src/hmc5883l.cpp \
		./dev/src/pwm.cpp \
		./dev/src/filter.cpp \
		./dev/src/i2cdev.cpp \
		./dev/src/imu.cpp \
		./dev/src/sensfusion6.cpp \
		./dev/src/joystick.cpp \
		./src/pid.cpp \
		./src/timer.cpp \
		./src/Kalman.cpp \
		./src/kalman_filter.cpp \
		./src/control.cpp
		#./dev/src/ms5611.cpp

INCLUDE = $(shell pkg-config --cflags opencv) \
		-I./include \
		-I./../include \
		-I./dev/include \
		-I/usr/local/include

#LIBS = $(shell pkg-config --libs opencv) -lpigpio -lpthread
LIBS = -lpigpio -lpthread -lrt

OBJECTS = $(SOURCES:.cpp=.o)

$(TARGET):$(OBJECTS)
#	$(CC) -o $@ -c $^ $(INCLUDE) $(LIBS)

#$(SOURCES):$(TARGET)
	$(CC) -o $(TARGET) $(SOURCES) $(INCLUDE) $(LIBS)	

#$(OBJECTS):$(SOURCES)
#	$(CC) -c $(SOURCES) $(INCLUDE) -o $(OBJECTS)
#$(TARGET):$(OBJECTS)
#	$(CC) -o $(TARGET) $(OBJECTS) $(INCLUDE) $(LIBS)

clean:
	rm -rf $(OBJECTS) $(TARGET)

%.o:%.cpp
	$(CC) -I $(INCLUDE) -o $@ -c $<

