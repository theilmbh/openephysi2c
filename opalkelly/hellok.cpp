// compile with g++ ./libokFrontPanel.so hellok.cpp, having the so in the same folder
#include <iostream>
using namespace std;
#include "okFrontPanelDLL.h"


int main() 
{

unsigned char s[15];
    
s[0] = 'a';
s[1] = 'b';

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
std::cout << "Writing to 0x04" << "\n";
error = dev.WriteI2C(0x04, 1, s);
std::cout << "returned status: " << error << "\n";

return 0;
}
}


/*
Quick reference: error codes
typedef enum {
	ok_NoError                    = 0,
	ok_Failed                     = -1,
	ok_Timeout                    = -2,
	ok_DoneNotHigh                = -3,
	ok_TransferError              = -4,
	ok_CommunicationError         = -5,
	ok_InvalidBitstream           = -6,
	ok_FileError                  = -7,
	ok_DeviceNotOpen              = -8,
	ok_InvalidEndpoint            = -9,
	ok_InvalidBlockSize           = -10,
	ok_I2CRestrictedAddress       = -11,
	ok_I2CBitError                = -12,
	ok_I2CNack                    = -13,
	ok_I2CUnknownStatus           = -14,
	ok_UnsupportedFeature         = -15,
	ok_FIFOUnderflow              = -16,
	ok_FIFOOverflow               = -17,
	ok_DataAlignmentError         = -18,
	ok_InvalidResetProfile        = -19,
	ok_InvalidParameter           = -20
} ok_ErrorCode;

*/


