distanceStr = input('How many miles are you traveling?')
distance = int(distanceStr)

if distance <= 3:
	modeOfTransport = 'walk'
elif distance > 3 and distance <= 300:
	modeOfTransport = 'drive'
else:
	modeOfTransport = 'fly'

print('you should {} to your destination' .format(modeOfTransport))
