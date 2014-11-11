OptodeConversion_Rscript
========================

This R function is useful for converting phase and temperature values from Presens PSt3 optodes into %O2 saturation using previously recorded calibration values. Required inputs to the function are the phase and temperature during measurement, as well as the phase and temperature for the sensor calibrated to 0% O2 saturation and 100% O2 saturation. The function output provide a %O2 saturation value. Linking this function with the plyr package in R and the ddply function can quickly provide a means of analyzing data from multiple sensors with different calibrations. More details are provided at www.nate-miller.org/blog/presens-optode-conversion-phase-into-saturation-using-r-function
