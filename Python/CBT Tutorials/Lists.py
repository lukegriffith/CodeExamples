names = ["Luke","Jessica","Mark","Caroline"]

for index in range(0,len(names)):
	print(names[index],'is found at index:',index)

#This, using the length has created a new range of numbers.

#This part of the code, is asking for what current index to replace, then you provide a name that replaces it - the names[newIndex] uses the index specified and replaces it with newName

raw_newIndex = input('Please enter the Index to repalace:')
newIndex = int(raw_newIndex)

newName = input('Please enter new name:')

names[newIndex] = newName
print(names)



#This uses the .append function to add the new name to the end of the list

newName = input('Please enter the name to add to the list:')
names.append(newName)
print(names)

#this removes a name based on its value
remName = input('Please enter the name to remove from the list:')
names.remove(remName)
print(names) 
