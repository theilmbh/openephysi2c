// compile with g++ ./libokFrontPanel.so hellok.cpp, having the so in the same folder
#include <iostream>
using namespace std;
#include "okFrontPanelDLL.h"


int main() 
{

unsigned char *s;
    

//List devices
okCFrontPanel dev;
okCFrontPanel::ErrorCode error;

int devCount = dev.GetDeviceCount();
for (int i=0; i < devCount; i++) {
	std::cout << "Device[" << i << "] Model : " << dev.GetDeviceListModel(i) << "\n";
	std::cout << "Device[" << i << "] Serial : " << dev.GetDeviceListSerial(i) << "\n";


// Open the first device available
std::cout << "Opening first device" << "\n";
dev.OpenBySerial();
error = dev.ConfigureFPGA("main.bit");
std::cout << "returned status: " << error << "\n";

//Try to write to the i2c wire
std::cout << "Writing to 0x03" << "\n";
error = dev.WriteI2C(0x03, 4, s);
std::cout << "returned status: " << error << "\n";

return 0;
}
}
