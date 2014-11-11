
#2014 Nate Miller
#This function can be used to convert measured phase and temperature output from a Presens PSt3 optode sensor (spot or probe)
#into %O2 saturation using user predefined calibration values for phase and temperature at 0% O2 saturation and 100% O2 
#saturation. 

#cal0 = phase value of 0% O2 saturation calibration
#T0 = temperature value of 0% O2 saturation calibration
#cal100 = phase value of 100% O2 saturation calibration
#T100 = temperature value of 100% O2 saturation calibration
#phase = measured phase angle
#temp = measured temp

#the output is the variable "saturation" which is the percent %O2 saturation

optode<-function(cal0,T0,cal100,T100,phase,temp) {
	
	f1=0.801
	deltaPsiK=-0.08
	deltaKsvK=0.000383
	m=22.9
	tan0T100=tan(((cal0+deltaPsiK*(T100-T0)))*pi/180)
	tan0Tm=tan((cal0+(deltaPsiK*(temp-T0)))*pi/180)
	tan100T100=tan(cal100*pi/180)
	tanmTm=tan(phase*pi/180)
	A=tan100T100/tan0T100*1/m*100^2
	B=tan100T100/tan0T100*100+tan100T100/tan0T100*1/m*100-f1*1/m*100-100+f1*100
	C=tan100T100/tan0T100-1
	KsvT100=(-B+(sqrt(B^2-4*A*C)))/(2*A)
	KsvTm=KsvT100+(deltaKsvK*(temp-T100))
	a=tanmTm/tan0Tm*1/m*KsvTm^2
	b=tanmTm/tan0Tm*KsvTm+tanmTm/tan0Tm*1/m*KsvTm-f1*1/m*KsvTm-KsvTm+f1*KsvTm
	c=tanmTm/tan0Tm-1
	saturation=(-((tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*(KsvT100+(deltaKsvK*(temp-T100)))
	+(tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*1/m*(KsvT100+(deltaKsvK*(temp-T100)))-f1*1/m*
	(KsvT100+(deltaKsvK*(temp-T100)))-(KsvT100+(deltaKsvK*(temp-T100)))+f1*(KsvT100+(deltaKsvK*(temp-T100))))+(sqrt((((tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*(KsvT100+(deltaKsvK*(temp-T100)))+(tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*1/m*(KsvT100+(deltaKsvK*(temp-T100)))-f1*1/m*(KsvT100+(deltaKsvK*(temp-T100)))-(KsvT100+(deltaKsvK*(temp-T100)))+f1*(KsvT100+(deltaKsvK*(temp-T100)))))^2-4*((tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*1/m*(KsvT100+(deltaKsvK*(temp-T100)))^2)*((tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))-1))))/(2*((tan(phase*pi/180))/(tan((cal0+(deltaPsiK*(temp-T0)))*pi/180))*1/m*(KsvT100+(deltaKsvK*(temp-T100)))^2))
}

