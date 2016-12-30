--Alison Taylor
--09/17/2015- v.1  09/24/2015 v.2 09/27/2015 v.2.5 10/01/2015 v.3 10/04/2015 v.3.5
--Character Creator-Contains the table for creating a character as well as the interface for the user

local character=require "charBehaviors"
charCreate={}--this table represents the charCreate class,which will double as the metatable for the instances
charCreate.__index=charCreate -- failed table lookups on charCreate instances should fallback to the class table,to get methods

charSave={}--this table represents an array of saved characters
for i=1, 6 do--creates an array of size 6
	charSave[i]=0
end

saveSlots={}--this table represents the saveSlots class, which will double as the metatable for the instances
saveSlots.__index=saveSlots --failed table lookups on saveSlots instances should fallback to the class table, to get methods

function saveSlots.create(openSlot, currentSlot)
	local slots={}--new objects
	setmetatable(slots, saveSlots)--make slots handle lookups
	slots.openSlot=0 --used to keep track of first save slot open
	slots.currentSlot=0 --used to keep track of current load file/ save slot
	return slots
end

function saveSlots:setOpenSlot(unusedSlot)--used to the set the current first open save slot
	self.openSlot=unusedSlot
end

function saveSlots:setCurrentSlot(loadedSlot)--used to set the current slot loaded
	self.currentSlot=loadedSlot
end

function saveSlots:getOpenSlot()--used to get the current first open save slot
	return self.openSlot
end

function saveSlots:getCurrentSlot()--used to get the current slot loaded
	return self.currentSlot
end

saveTrack=saveSlots.create(0,0)--used to keep track of save slots


--syntax equivalent to "charCreate.new= function..."
function charCreate.create(name,hairColor,eyeColor,skinColor,height,classType, gender, charAge, charWeight, weaponType)--creates a new instance of charHp
	local char={}--new object
	setmetatable(char,charCreate)--make char handle lookup
	char.name=""--initialize objects
	char.hairColor=""
	char.eyeColor=""
	char.skinColor=""
	char.height=""
	char.classType=""
	char.gender=""
	char.charAge=""
	char.charWeight=""
	char.weaponType=""
	return char
end

function charCreate:setName(nameChoice)--used to set the value of name
     self.name=nameChoice
end

function charCreate:setHairColor(hairChoice)--used to set the value of haircolor
	self.hairColor=hairChoice
end

function charCreate:setEyeColor(eyeChoice)--used to set the value of eyeColor
	self.eyeColor=eyeChoice
end

function charCreate:setSkinColor(skinChoice)--used to set the value of skinColor
	self.skinColor=skinChoice
end

function charCreate:setHeight(heightChoice)--used to set the value of height
	self.height=heightChoice
end

function charCreate:setClassType(classSelection)--used to set the value of classType
	self.classType=classSelection
end

function charCreate:setGender(genderChoice)--used to set the value of gender
	self.gender=genderChoice
end

function charCreate:setCharAge(ageChoice)--used to set the value of charAge
	self.charAge=ageChoice
end

function charCreate:setCharWeight(weightChoice)--used to set the value of charWeight
	self.charWeight=weightChoice
end

function charCreate:setWeaponType(weaponChoice)--used to set the value of weaponType
	self.weaponType=weaponChoice
end

function charCreate:getHairColor()--used to get the value of hairColor
     return self.hairColor
end

function charCreate:getEyeColor()--used to get the value of eyeColor
	return self.eyeColor
end

function charCreate:getSkinColor()--used to get the value of skinColor
	return self.skinColor
end

function charCreate:getHeight()--used to get the value of height
	return self.height
end

function charCreate:getClassSelection()--used to get the value of classType
	return self.classType
end

function charCreate:getGender()--used to get the value of gender
	return self.gender
end

function charCreate:getName()--used to get the value of name
	return self.name
end

function charCreate:getAge()--used to get the value of charAge
	return self.charAge
end

function charCreate:getWeight()--used to get the value of charWeight
	return self.charWeight
end

function charCreate:getWeaponType()--used to get the value of weaponType
	return self.weaponType
end


function startUp()--displays the start up options
	selection=0
	print("Character Creation Screen")
	print("Welcome to Character Creation! ")
    print("Please Select an option from the following :")
	print("1 - Make a new Character")
	print("2- Load a Character")
	print("3- view/modify current character")
	print("4- Simulate attacking, defending, and healing with current character")
	print("5- exit\n")
	selection=io.read()

    if selection=="1" or selection =="2" or selection=="3" or selection=="4" or selection=="5" then
	   if selection=="1" then--calls interface function to display character creation options
			interface()


	   elseif selection=="2" then
			loadChar()---call function to get user to select a saved character to load


		elseif selection=="3" then
			currentS=saveTrack:getCurrentSlot()

			if  currentS>0 then

				if charSave[currentS]~=0 then
					mod(charSave[currentS])
				else
					print("Please make or load a charcter first. ")
					startUp()
				end
			else
				print("No character data exists.")
				selection=0
				startUp()
			end

		elseif selection=="4" then
			currentS=saveTrack:getCurrentSlot()

			if  currentS>0 then
				if charSave[currentS]~=nil then
					print("Please select one of the following to simulate- \n1. Attacking ,2. Defending 3. Healing. ")--ask user what they would like to simulate
					print("Please input a number 1-3: ")
					local choice=io.read()--gets answer from user
					if choice=="1" or choice=="2" or choice=="3" then
						sim(choice)--calls function that makes proeper simulation function call
					else
						repeat
							print("Incorrect input entered.")
							print("Please select one of the following to simulate-]n1. Attacking ,2. Defending, 3. Healing. ")--ask user what they would like to simulate
							print("Please input a number 1-3: ")
							local choice=io.read()--gets answer from user
						until choice=="1" or choice=="2" or choice=="3"
						if choice=="1" or choice=="2" or choice=="3" then
							sim(choice)--calls function that makes proper simulation function call
						end
					end
				else
					print("Please make or load a charcter first. ")
					startUp()
				end
			else
				print("No character data exists.")
				selection=0
				startUp()
			end






		else
			print("Congrats on your character(s)!")
			print("Please input any key to exit: ")
			io.read()
			os.exit(0)

		end


	else
		repeat
			print("Incorrect input entered.")
			print("Please Select an option from the following :")
			print("1 - Make a new Character")
			print("2- Load a Character")
			print("3- view/modify current character")
			print("4- Simulate attacking, defending, and healing with current character")
			print("5- exit\n")
			selection=io.read()
		until  selection=="1" or selection =="2" or selection=="3" or selection=="4" or selection=="5"


		if selection=="1" then--calls interface function to display character creation options
			interface()


		elseif selection=="2" then
			loadChar()---call function to get user to select a saved character to load


		elseif selection=="3" then
		    currentS=saveTrack:getCurrentSlot()

			if  currentS>0 then
				if charSave[currentS]~=nil then
					mod(charSave[currentS])
				else
					print("Please make or load a charcter first. ")
					startUp()
				end
			else
				print("No character data exists/or is not loaded.")
				selection=0
				startUp()
			end

		elseif selection=="4" then
			currentS=saveTrack:getCurrentSlot()

			if  currentS>0 then
				if charSave[currentS]~=nil then
					print("Please select one of the following to simulate-1. Attacking ,2. Defending, 3. Healing. ")--ask user what they would like to simulate
					print("Please input a number 1-3: ")
					local choice=io.read()--gets answer from user
					if choice=="1" or choice=="2" or choice=="3" then
					sim(choice)--calls function that makes proeper simulation function call
					else
						repeat
							print("Incorrect input entered.")
							print("Please select one of the following to simulate-1. Attacking ,2. Defending 3. Healing. ")--ask user what they would like to simulate
							print("Please input a number 1-3: ")
							local choice=io.read()--gets answer from user
						until choice=="1" or choice=="2" or choice=="3"
						if choice=="1" or choice=="2" or choice=="3" then
							sim(choice)--calls function that makes proper simulation function call
						end
					end
				else
					print("Please make or load a charcter first. ")
					startUp()
				end
			else
				print("No character data exists.")
				selection=0
				startUp()
			end



		else
			print("Congrats on your character(s)!")
			print("Please input any key to exit: ")
			io.read()
			os.exit(0)
		end
	end

end


--interface
function interface()--displays the creation interface
	charData=charCreate.create("","","","","","","","","","")
	print("Please select one of the following hair color choices- [1]blonde,[2]brown,\n[3]red,[4]black,[5]pink,[6]blue,[7]purple: ")
	hairCheck=io.read()--gets hairColor information


	if hairCheck=="1" or hairCheck=="2"or hairCheck=="3" or hairCheck=="4" or hairCheck=="5" or hairCheck=="6" or hairCheck=="7" then
		if hairCheck=="1" then--set hairColor to blonde
			charData:setHairColor("blonde")
		elseif hairCheck=="2" then--set hairColor to brown
			charData:setHairColor("brown")
		elseif hairCheck=="3" then--set hairColor to red
			charData:setHairColor("red")
		elseif hairCheck=="4" then--set hairColor to black
			charData:setHairColor("black")
		elseif hairCheck=="5" then--set hairColor to pink
			charData:setHairColor("pink")
		elseif hairCheck=="6" then--set hairColor to blue
			charData:setHairColor("blue")
		else--set hairColor to purple
			charData:setHairColor("purple")
		end
	else

		repeat--repeats until proper hairColor is input
			print("Incorrect input entered. ")
			print("Please select one of the following hair color choices- [1]blonde,[2]brown,\n[3]red,[4]black,[5]pink,[6]blue,[7]purple: ")
			hairCheck=io.read()--gets hairColor information
		until hairCheck=="1" or hairCheck=="2"or hairCheck=="3" or hairCheck=="4" or hairCheck=="5" or hairCheck=="6" or hairCheck=="7"

		if hairCheck=="1" then--set hairColor to blonde
			charData:setHairColor("blonde")
		elseif hairCheck=="2" then--set hairColor to brown
			charData:setHairColor("brown")
		elseif hairCheck=="3" then--set hairColor to red
			charData:setHairColor("red")
		elseif hairCheck=="4" then--set hairColor to black
			charData:setHairColor("black")
		elseif hairCheck=="5" then--set hairColor to pink
			charData:setHairColor("pink")
		elseif hairCheck=="6" then--set hairColor to blue
			charData:setHairColor("blue")
		else--set hairColor to purple
			charData:setHairColor("purple")
		end
	end


	print("Please select one of the following eye color choices- \n[1]blue, [2]green, [3]brown, [4]black,\n[5]grey, [6]red, [7]purple: ")
	eyeCheck=io.read()--gets eyeColor information


	if eyeCheck=="1" or eyeCheck=="2"or eyeCheck=="3" or eyeCheck=="4" or eyeCheck=="5" or eyeCheck=="6" or eyeCheck=="7" then
		if eyeCheck=="1" then--set eyeColor to blue
			charData:setEyeColor("blue")
		elseif eyeCheck=="2" then--set eyeColor to green
			charData:setEyeColor("green")
		elseif eyeCheck=="3" then--set eyeColor to brown
			charData:setEyeColor("brown")
		elseif eyeCheck=="4" then--set eyeColor to black
			charData:setEyeColor("black")
		elseif eyeCheck=="5" then--set eyeColor to grey
			charData:setEyeColor("grey")
		elseif eyeCheck=="6" then--set eyeColor to red
			charData:setEyeColor("red")
		else--set eyeColor to purple
			charData:setEyeColor("purple")
		end

	else

		repeat--repeats until proper eyeColor is input
			print("Incorrect input entered. ")
			print("Please select one of the following eye color choices- \n[1]blue, [2]green, [3]brown, [4]black,\n[5]grey, [6]red, [7]purple: ")
			eyeCheck=io.read()--gets eyeColor information
		until eyeCheck=="1" or eyeCheck=="2"or eyeCheck=="3" or eyeCheck=="3" or eyeCheck=="4" or eyeCheck=="5" or eyeCheck=="6" or eyeCheck=="7"

		if eyeCheck=="1" then--set eyeColor to blue
			charData:setEyeColor("blue")
		elseif eyeCheck=="2" then--set eyeColor to green
			charData:setEyeColor("green")
		elseif eyeCheck=="3" then--set eyeColor to brown
			charData:setEyeColor("brown")
		elseif eyeCheck=="4" then--set eyeColor to black
			charData:setEyeColor("black")
		elseif eyeCheck=="5" then--set eyeColor to grey
			charData:setEyeColor("grey")
		elseif eyeCheck=="6" then--set eyeColor to red
			charData:setEyeColor("red")
		else--set eyeColor to purple
			charData:setEyeColor("purple")
	    end
	end


	print("Please select one of the following skin colors- [1]Porcelain, [2]Mocha, \n[3]Caramel,[4]Mahogany, [5]Tan: ")
	skinCheck=io.read()--get skinColor information


	if skinCheck =="1" or skinCheck=="2" or skinCheck=="3" or skinCheck=="4" or skinCheck=="5" then
		if skinCheck=="1" then--set skinColor to Porcelain
			charData:setSkinColor("Porcelain")
		elseif skinCheck=="2" then--set skinColor to Mocha
			charData:setSkinColor("Mocha")
		elseif skinCheck=="3" then--set skinColor to Caramel
			charData:setSkinColor("Caramel")
		elseif skinCheck=="4" then--set skinColor to Mahogany
			charData:setSkinColor("Mahogany")
		else --set skinColor to Tan
			charData:setSkinColor("Tan")
		end

	else

		repeat--repeats until proper skinColor is input
			print("Incorrect input entered. ")
			print("Please select one of the following skin colors- [1]Porcelain, [2]Mocha, \n[3]Caramel,[4]Mahogany, [5]Tan")
			skinCheck=io.read()--get skinColor information
		until skinCheck=="1" or skinCheck=="2" or skinCheck=="3" or skinCheck=="4" or skinCheck=="5"

		if skinCheck=="1" then--set skinColor to Porcelain
			charData:setSkinColor("Porcelain")
		elseif skinCheck=="2" then--set skinColor to Mocha
			charData:setSkinColor("Mocha")
		elseif skinCheck=="3" then--set skinColor to Caramel
			charData:setSkinColor("Caramel")
		elseif skinCheck=="4" then--set skinColor to Mahogany
			charData:setSkinColor("Mahogany")
		else --set skinColor to Tan
			charData:setSkinColor("Tan")
		end


	end

	print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
	heightCheck=io.read()--get the height information
	heightNum=tonumber(heightCheck)--converts height string to number

	if heightNum~=nil then--if heightCheck is a number
		if heightNum >= 4.0 and heightNum <= 8.0 then
			charData:setHeight(heightNum)
		else

			repeat--repeats until proper height is input
				print("Incorrect input entered. ")
				print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
				heightCheck=io.read()--get height Information
				heightNum=tonumber(heightCheck)--converts height string to number

				while heightNum==nil do--ask for input again if a number was not entered. continues asking until a number is entered
					print("Incorrect input entered. ")
					print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
					heightCheck=io.read()--get height Information
					heightNum=tonumber(heightCheck)--converts height string to number
				end
			until heightNum>=4.0 and heightNum<=8.0

		charData:setHeight(heightNum)--sets height once proper data has been entered
		end
	else--if input was not a number

			repeat--repeats until proper height is input
				print("Incorrect input entered. ")
				print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
				heightCheck=io.read()--get height Information
				heightNum=tonumber(heightCheck)--converts height string to number

				while heightNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
				print("Incorrect input entered. ")
				print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
				heightCheck=io.read()--get height Information
				heightNum=tonumber(heightCheck)--converts height string to number
				end
			until heightNum>=4.0 and heightNum<=8.0
		charData:setHeight(heightNum)--setsHeight once proper data has been entered
	end


	print("Please select a class for your player- [1]mage, [2]cleric, or [3]paladin : ")
	classCheck=io.read()--gets the classSelection information

	if classCheck=="1" or classCheck=="2" or classCheck=="3"then
		if classCheck=="1" then--set classType to mage
			charData:setClassType("mage")
		elseif classCheck=="2" then--set classType to cleric
			charData:setClassType("cleric")
		else--set classType to paladin
			charData:setClassType("paladin")
		end

	else

		repeat--repeats until proper classType is input
			print("Incorrect input entered. ")
			print("Please select a class for your player- [1]mage, [2]cleric, or [3]paladin : ")
			classCheck=io.read()--gets the classSelection information
		until classCheck=="1" or classCheck=="2" or classCheck=="3"

		if classCheck=="1" then--set classType to mage
			charData:setClassType("mage")
		elseif classCheck=="2" then--set classType to cleric
			charData:setClassType("cleric")
		else--set classType to paladin
			charData:setClassType("paladin")
		end


	end

	print("Is your character a female or male? \nPlease enter 1 for female or 2 for male: ")
	genderCheck=io.read()--gets the gender information

	if genderCheck=="1" or genderCheck=="2" then
		if genderCheck=="1" then
			charData:setGender("female")
		else
			charData:setGender("male")
		end
	else

		repeat--repeats until proper gender information is input
			print("Incorrect input entered." )
			print("Is your character a female or male? \nPlease enter 1 for female or 2 for male:  ")
			genderCheck=io.read()--gets the gender information
		until genderCheck=="1" or genderCheck=="2"
		if genderCheck=="1" then
			charData:setGender("female")
		else
			charData:setGender("male")
		end

	end

	print("How old is your character? Please input a number between 15 and 50: ")--ask user for age,allow them to input a number between 15 and 50
	ageCheck=io.read()--gets the age information
	ageNum=tonumber(ageCheck)--converts ageCheck string to number

	if ageNum~=nil then--if ageCheck is a number
		if ageNum >= 15.0 and ageNum <= 50.0 then
			charData:setCharAge(ageNum)--sets age if proper data has been entered
		else

			repeat--repeats until proper age is input
				print("Incorrect input entered. ")
				print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
				ageCheck=io.read()--gets the age information
				ageNum=tonumber(ageCheck)--converts ageCheck string to number

				while ageNum==nil do--ask for input again if a number was not entered. continues asking until a proper number is entered
					print("Incorrect input entered. ")
					print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
					ageCheck=io.read()--gets the age information
					ageNum=tonumber(ageCheck)--converts ageCheck string to number
				end
			until ageNum>=15.0 and ageNum<=50.0

		charData:setCharAge(ageNum)--sets age once proper data has been entered
		end
	else--if input was not a number

			repeat--repeats until proper age is input
				print("Incorrect input entered. ")
				print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
				ageCheck=io.read()--gets the age information
				ageNum=tonumber(ageCheck)--converts ageCheck string to number

				while ageNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
					print("Incorrect input entered. ")
					print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
					ageCheck=io.read()--gets the age information
					ageNum=tonumber(ageCheck)--converts ageCheck string to number
				end
			until ageNum>=15.0 and ageNum<=50.0
		charData:setCharAge(ageNum)--setsCharAge once proper data has been entered
	end


	print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
	weightCheck=io.read()--gets the weight information
	weightNum=tonumber(weightCheck)--converts weightCheck string to number

	if weightNum~=nil then--if weightCheck is a number
		if weightNum >= 90.0 and weightNum <= 350.0 then
			charData:setCharWeight(weightNum)--sets weight if proper data has been entered
		else

			repeat--repeats until proper weight is input
				print("Incorrect input entered. ")
				print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
				weightCheck=io.read()--gets the weight information
				weightNum=tonumber(weightCheck)--converts weightCheck string to number


				while weightNum==nil do--ask for input again if a number was not entered. continues asking until a proper number is entered
					print("Incorrect input entered. ")
					print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
					weightCheck=io.read()--gets the weight information
					weightNum=tonumber(weightCheck)--converts weightCheck string to number
				end

			until weightNum>=90.0 and weightNum<=350.0

		charData:setCharWeight(WeightNum)--sets weight once proper data has been entered
		end
	else--if input was not a number

			repeat--repeats until proper weight is input
				print("Incorrect input entered. ")
				print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
				weightCheck=io.read()--gets the weight information
				weightNum=tonumber(weightCheck)--converts weightCheck string to number


				while weightNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
					print("Incorrect input entered. ")
					print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
					weightCheck=io.read()--gets the weight information
					weightNum=tonumber(weightCheck)--converts weightCheck string to number
				end

			until weightNum>=90.0 and weightNum<=350.0
		charData:setCharWeight(weightNum)--setsCharWeight once proper data has been entered
	end


	print("Please select a weapon for your player- [1]sword, [2]staff, [3]magic grimoire, \n[4] dagger, or [5] axe : ")
	print("Alternativly you may input 0 to have the character creator automatically select the best fit for your class. ")
	weaponTypeCheck=io.read()--gets the weaponType information

	if weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5" then
		if weaponTypeCheck=="1" then--set weaponType to sword
			charData:setWeaponType("sword")
		elseif weaponTypeCheck=="2" then--set weaponType to staff
			charData:setWeaponType("staff")
		elseif weaponTypeCheck=="3" then--set weaponType to magic grimoire
			charData:setWeaponType("magic grimoire")
		elseif weaponTypeCheck=="4" then --set weaponType to dagger
			charData:setWeaponType("dagger")
		else--set weaponType to axe
			charData:setWeaponType("axe")
		end

	elseif weaponTypeCheck=="0" then--selects the best weapon choice for the character class
		if charData:getClassSelection()=="mage" then--if classType is mage then sets weaponType to magic Grimoire
			charData:setWeaponType("magic grimoire")
		elseif charData:getClassSelection()=="paladin" then--if classType is paladin then sets weaponType to sword
			charData:setWeaponType("sword")
		else--else classType is cleric and weaponType is set to staff
			charData:setWeaponType("staff")
		end

	else

		repeat--repeats until proper weaponType is input
			print("Incorrect input entered.")
			print("Please select a weapon for your player- [1]sword, [2]staff, [3]magic grimoire, \n[4] dagger, or [5] axe : ")
			print("Alternativly you may input 0 to have the character creator automatically select the best fit for your class. ")
			weaponTypeCheck=io.read()--gets the weaponType information
		until weaponTypeCheck=="0" or weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5"

		if weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5" then
			if weaponTypeCheck=="1" then--set weaponType to sword
				charData:setWeaponType("sword")
			elseif weaponTypeCheck=="2" then--set weaponType to staff
				charData:setWeaponType("staff")
			elseif weaponTypeCheck=="3" then--set weaponType to magic grimoire
				charData:setWeaponType("magic grimoire")
			elseif weaponTypeCheck=="4" then --set weaponType to dagger
				charData:setWeaponType("dagger")
			else--set weaponType to axe
				charData:setWeaponType("axe")
			end

		else --selects the best weapon choice for the character class
			if charData:getClassSelection()=="mage" then--if classType is mage then sets weaponType to magic grimoire
				charData:setWeaponType("magic grimoire")
			elseif charData:getClassSelection()=="paladin" then--if classType is paladin then sets weaponType to sword
				charData:setWeaponType("sword")
			else--else classType is cleric and weaponType is set to staff
				charData:setWeaponType("staff")
			end
		end


	end


	print("Please input a name for your character: ")
	nameSel=io.read()
	while string.find(nameSel,"save slot 1")~=nil or string.find(nameSel,"save slot 2")~=nil or string.find(nameSel,"save slot 3")~=nil or string.find(nameSel,"save slot 4")~=nil or string.find(nameSel,"save slot 5") or string.find(nameSel,"save slot 6")~=nil do
	--makes sure user does not enter a name with reserved words
		print("You have inputted an improper name. Names may not contain the phrase save slot. ")
		print("Please input a name for your character: ")
		nameSel=io.read()
	end
	charData:setName(nameSel)--sets name of character

	print("Would you like view and modify attributes? Y/N : ")
	choice=io.read()--gets choice from user
	choiceLower=string.lower(choice)--sets choice to lowercase for checks

	if choiceLower~="n" and choiceLower~="y" then--if incorrect input was entered

		repeat--repeats until y or n is input
			print("Incorrect input was entered. ")
			print("Would you like view and modify attributes? Y/N : ")
			choice=io.read()--gets choice from user
			choiceLower=string.lower(choice)--sets choice to lowercase for checks
		until choiceLower=="y" or choiceLower=="n"
	end
    if choiceLower=="y" then--if y is entered then calls mod function
		currentS=saveTrack:getCurrentSlot()
		openS=saveTrack:getOpenSlot()
		saveTrack:setCurrentSlot(currentS+1)--sets the current save slot loaded
		saveTrack:setOpenSlot(openS+1)--ensure character will be saved in the first open slot
		mod(charData)--calls function view/modify current charcter
	end
	if choiceLower=="n" then--if choiceLower==n then returns to main menu
		currentS=saveTrack:getCurrentSlot()
		openS=saveTrack:getOpenSlot()
		saveTrack:setCurrentSlot(currentS+1)--sets the current save slot loaded
		saveTrack:setOpenSlot(openS+1)--ensure character will be saved in the first open slot
		print("Now commencing save to slot "..saveTrack:getCurrentSlot())
		save(charData)--saves character data
		print("Your character is complete! Please hit any key to return to the main menu: ")
		io.read()
		startUp()
	end

end




function mod(charData)--used to modify current character selected
    choiceLower="y"
	while choiceLower=="y" do--displays all attributes
		print("1. name: "..charData:getName())
		print("2. hair color: "..charData:getHairColor())
		print("3. eye color:  "..charData:getEyeColor())
		print("4. skin color: "..charData:getSkinColor())
		print("5. height: "..charData:getHeight())
		print("6. class type: "..charData:getClassSelection())
		print("7. gender: "..charData:getGender())
		print("8. age: "..charData:getAge())
		print("9. weight: "..charData:getWeight())
		print("10. weapon: "..charData:getWeaponType())
		print("If you would like to make a modifcation please enter one of the above attribute numbers[1-10], if not hit any other key: ")
		selection=io.read()--get selection from user


			if selection=="1" then--allow user to modify name
				print("Please input a name for your character: ")
				nameSel=io.read()
				while nameSel=="save slot 1" or nameSel=="save slot 2" or nameSel=="save slot 3" or nameSel=="save slot 4" or nameSel=="save slot 5" or nameSel=="save slot 6" do
					--makes sure user does not enter a name with reserved words
					print("You have inputted an improper name. Names may not contain the phrase save slot. ")
					print("Please input a name for your character: ")
					nameSel=io.read()
					end
				charData:setName(nameSel)--sets setName of character
				print("Would you like to modify another attribute? Y/N : ")
				choice=io.read()--gets choice from user
				choiceLower=string.lower(choice)--sets choice to lowercase for checks

			elseif selection=="2" then--allow user to modify hairColor
				print("Please select one of the following hair color choices- [1]blonde,[2]brown,\n[3]red,[4]black,[5]pink,[6]blue,[7]purple: ")
				hairCheck=io.read()--gets hairColor information
					if hairCheck=="1" or hairCheck=="2"or hairCheck=="3" or hairCheck=="4" or hairCheck=="5" or hairCheck=="6" or hairCheck=="7" then
						if hairCheck=="1" then--set hairColor to blonde
							charData:setHairColor("blonde")
					    elseif hairCheck=="2" then--set hairColor to brown
							charData:setHairColor("brown")
						elseif hairCheck=="3" then--set hairColor to red
							charData:setHairColor("red")
						elseif hairCheck=="4" then--set hairColor to black
							charData:setHairColor("black")
						elseif hairCheck=="5" then--set hairColor to pink
							charData:setHairColor("pink")
						elseif hairCheck=="6" then--set hairColor to blue
							charData:setHairColor("blue")
						else--set hairColor to purple
							charData:setHairColor("purple")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
					else

						repeat--repeats until proper hairColor is input
							print("Incorrect input entered. ")
							print("Please select one of the following hair color choices- [1]blonde,[2]brown,\n[3]red,[4]black,[5]pink,[6]blue,[7]purple: ")
							hairCheck=io.read()--gets hairColor information
						until hairCheck=="1" or hairCheck=="2"or hairCheck=="3" or hairCheck=="4" or hairCheck=="5" or hairCheck=="6" or hairCheck=="7"

						if hairCheck=="1" then--set hairColor to blonde
							charData:setHairColor("blonde")
						elseif hairCheck=="2" then--set hairColor to brown
							charData:setHairColor("brown")
						elseif hairCheck=="3" then--set hairColor to red
							charData:setHairColor("red")
						elseif hairCheck=="4" then--set hairColor to black
							charData:setHairColor("black")
						elseif hairCheck=="5" then--set hairColor to pink
							charData:setHairColor("pink")
						elseif hairCheck=="6" then--set hairColor to blue
							charData:setHairColor("blue")
						else--set hairColor to purple
							charData:setHairColor("purple")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
					end

			elseif selection=="3" then--allow user to modify eyeColor
					print("Please select one of the following eye color choices- \n[1]blue, [2]green, [3]brown, \n[4]black,[5]grey, [6]red, [7]purple: ")
					eyeCheck=io.read()--gets eyeColor information
					charData:setEyeColor(eyeCheck)--sets eyeColor

					if eyeCheck=="1" or eyeCheck=="2"or eyeCheck=="3" or eyeCheck=="4" or eyeCheck=="5" or eyeCheck=="6" or eyeCheck=="7" then
						if eyeCheck=="1" then--set eyeColor to blue
							charData:setEyeColor("blue")
						elseif eyeCheck=="2" then--set eyeColor to green
							charData:setEyeColor("green")
						elseif eyeCheck=="3" then--set eyeColor to brown
							charData:setEyeColor("brown")
						elseif eyeCheck=="4" then--set eyeColor to black
							charData:setEyeColor("black")
						elseif eyeCheck=="5" then--set eyeColor to grey
							charData:setEyeColor("grey")
						elseif eyeCheck=="6" then--set eyeColor to red
							charData:setEyeColor("red")
						else--set eyeColor to purple
							charData:setEyeColor("purple")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
					else

						repeat--repeats until proper eyeColor is input
							print("Incorrect input entered. ")
							print("Please select one of the following eye color choices- \n[1]blue, [2]green, [3]brown, \n[4]black,[5]grey, [6]red, [7]purple: ")
							eyeCheck=io.read()--gets eyeColor information
						until eyeCheck=="1" or eyeCheck=="2"or eyeCheck=="3" or eyeCheck=="4" or eyeCheck=="5" or eyeCheck=="6" or eyeCheck=="7"

						if eyeCheck=="1" then--set eyeColor to blue
							charData:setEyeColor("blue")
						elseif eyeCheck=="2" then--set eyeColor to green
							charData:setEyeColor("green")
						elseif eyeCheck=="3" then--set eyeColor to brown
							charData:setEyeColor("brown")
						elseif eyeCheck=="4" then--set eyeColor to black
							charData:setEyeColor("black")
						elseif eyeCheck=="5" then--set eyeColor to grey
							charData:setEyeColor("grey")
						elseif eyeCheck=="6" then--set eyeColor to red
							charData:setEyeColor("red")
						else--set eyeColor to purple
							charData:setEyeColor("purple")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
				end

			elseif selection=="4" then--allow user to modify skinColor
				print("Please select one of the following skin colors- [1]Porcelain, [2]Mocha, \n[3]Caramel,[4]Mahogany, [5]Tan: ")
				skinCheck=io.read()--get skinColor information

					if skinCheck=="1" or skinCheck=="2" or skinCheck=="3" or skinCheck=="4" or skinCheck=="5" then
						if skinCheck=="1" then--set skinColor to Porcelain
							charData:setSkinColor("Porcelain")
						elseif skinCheck=="2" then--set skinColor to Mocha
							charData:setSkinColor("Mocha")
						elseif skinCheck=="3" then--set skinColor to Caramel
							charData:setSkinColor("Caramel")
						elseif skinCheck=="4" then--set skinColor to Mahogany
							charData:setSkinColor("Mahogany")
						else --set skinColor to Tan
							charData:setSkinColor("Tan")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
					else

						repeat--repeats until proper skinColor is input
							print("Incorrect input entered. ")
							print("Please select one of the following skin colors- [1]Porcelain, [2]Mocha,\n [3] Caramel,[4]Mahogany, [5]Tan: ")
							skinCheck=io.read()--get skinColor information
						until skinCheck=="1" or skinCheck=="2" or skinCheck=="3" or skinCheck=="4" or skinCheck=="5"

						if skinCheck=="1" then--set skinColor to Porcelain
							charData:setSkinColor("Porcelain")
						elseif skinCheck=="2" then--set skinColor to Mocha
							charData:setSkinColor("Mocha")
						elseif skinCheck=="3" then--set skinColor to Caramel
							charData:setSkinColor("Caramel")
						elseif skinCheck=="4" then--set skinColor to Mahogany
							charData:setSkinColor("Mahogany")
						else --set skinColor to Tan
							charData:setSkinColor("Tan")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks
					end

			elseif selection=="5" then--allow user to modify height
					print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
					heightCheck=io.read()--get the height information
					charData:setHeight(heightCheck)--sets height if correct input was obtained from the user

					if heightNum~=nil then--if heightCheck is a number

						if heightNum >= 4.0 and heightNum <= 8.0 then
							charData:setHeight(heightCheck)
							print("Would you like to modify another attribute? Y/N : ")
							choice=io.read()--gets choice from user
							choiceLower=string.lower(choice)--sets choice to lowercase for checks

						else

							repeat--repeats until proper height is input
							print("Incorrect input entered. ")
							print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
							heightCheck=io.read()--get height Information
							heightNum=tonumber(heightCheck)--converts height string to number

							while heightNum==nil do--ask for input again if a number was not entered. continues asking until a number is entered
								print("Incorrect input entered. ")
								print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
								heightCheck=io.read()--get height Information
								heightNum=tonumber(heightCheck)--converts height string to number
							end
							until heightNum>=4.0 and heightNum<=8.0

					charData:setHeight(heightCheck)--sets height once proper data has been entered
					print("Would you like to modify another attribute? Y/N : ")
					choice=io.read()--gets choice from user
					choiceLower=string.lower(choice)--sets choice to lowercase for checks
						end
					else--if input was not a number

						repeat--repeats until proper height is input
							print("Incorrect input entered. ")
							print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
							heightCheck=io.read()--get height Information
							heightNum=tonumber(heightCheck)--converts height string to number

							while heightNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
								print("Incorrect input entered. ")
								print("Please input a height for your character starting from 4.0(4 feet) to 8.0 : ")
								heightCheck=io.read()--get height Information
								heightNum=tonumber(heightCheck)--converts height string to number
							end
						until heightNum>=4.0 and heightNum<=8.0

					charData:setHeight(heightCheck)--setsHeight once proper data has been entered
					print("Would you like to modify another attribute? Y/N : ")
					choice=io.read()--gets choice from user
					choiceLower=string.lower(choice)--sets choice to lowercase for checks
					end

			elseif selection=="6" then--allow user to modify classSelection
					print("Please select a class for your player- [1]mage, [2]cleric, or [3]paladin: ")
					classCheck=io.read()--gets the classSelection information

					if classCheck=="1" or classCheck=="2" or classCheck=="3" then
						if classCheck=="1" then--set classType to mage
							charData:setClassType("mage")
						elseif classCheck=="2" then--set classType to cleric
							charData:setClassType("cleric")
						else--set classType to paladin
							charData:setClassType("paladin")
						end

						print("Would you like to modify another attribute? Y/N : ")
						choice=io.read()--gets choice from user
						choiceLower=string.lower(choice)--sets choice to lowercase for checks

					else

						repeat--repeats until proper skinColor is input
							print("Incorrect input entered. ")
							print("Please select a class for your player- [1]mage, [2]cleric, or [3]paladin: ")
						until classCheck=="1" or classCheck=="2" or classCheck=="3"

						if classCheck=="1" then--set classType to mage
							charData:setClassType("mage")
						elseif classCheck=="2" then--set classType to cleric
							charData:setClassType("cleric")
						else--set classType to paladin
							charData:setClassType("paladin")
						end

					charData:setClassType(classLower)--sets classType once proper input was taken in from user
					print("Would you like to modify another attribute? Y/N : ")
					choice=io.read()--gets choice from user
					choiceLower=string.lower(choice)--sets choice to lowercase for checks
					end

			elseif selection=="7" then--allow user to modify gender
					print("Is your character a female or male?  \nPlease enter 1 for Female or 2 For male: ")
					genderCheck=io.read()--gets the gender information


					if genderCheck=="1" or genderCheck=="2" then
						if genderCheck=="1" then
							charData:setGender("female")
						else
							charData:setGender("male")
						end

					else

						repeat--repeats until proper gender information is input
							print("Incorrect input entered." )
							print("Is your character a female or male? Please enter F or M: ")
							genderCheck=io.read()--gets the gender information

						until genderCheck=="1" or genderCheck=="2"

					if genderCheck=="1" or genderCheck=="2" then
						if genderCheck=="1" then
							charData:setGender("female")
						else
							charData:setGender("male")
						end
					end
					print("Would you like to modify another attribute? Y/N : ")
					choice=io.read()--gets choice from user
					choiceLower=string.lower(choice)--sets choice to lowercase for checks
					end

			elseif selection=="8" then --allow user to modify age
				print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
				ageCheck=io.read()--gets the age information
				ageNum=tonumber(ageCheck)--converts ageCheck string to number

				if ageNum~=nil then--if ageCheck is a number
					if ageNum >= 15 and ageNum <= 50 then
						charData:setCharAge(ageNum)--sets age if proper data has been entered

					else

						repeat--repeats until proper age is input
							print("Incorrect input entered. ")
							print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
							ageCheck=io.read()--gets the age information
							ageNum=tonumber(ageCheck)--converts ageCheck string to number

							while ageNum==nil do--ask for input again if a number was not entered. continues asking until a proper number is entered
								print("Incorrect input entered. ")
								print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
								ageCheck=io.read()--gets the age information
								ageNum=tonumber(ageCheck)--converts ageCheck string to number
							end
						until ageNum>=15 and ageNum<=50

						charData:setCharAge(ageNum)--sets age once proper data has been entered

					end
				else--if input was not a number

					repeat--repeats until proper age is input
						print("Incorrect input entered. ")
						print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
						ageCheck=io.read()--gets the age information
						ageNum=tonumber(ageCheck)--converts ageCheck string to number

						while ageNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
							print("Incorrect input entered. ")
							print("How old is your character? Please input a number between 15 and 50")--ask user for age,allow them to input a number between 15 and 50
							ageCheck=io.read()--gets the age information
							ageNum=tonumber(ageCheck)--converts ageCheck string to number
						end
					until ageNum>=15 and ageNum<=50
					charData:setCharAge(ageNum)--setsCharAge once proper data has been entered

				end
				print("Would you like to modify another attribute? Y/N : ")
				choice=io.read()--gets choice from user
				choiceLower=string.lower(choice)--sets choice to lowercase for checks

			elseif selection=="9" then --allow user to modify weight
				print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
				weightCheck=io.read()--gets the weight information
				weightNum=tonumber(weightCheck)--converts weightCheck string to number

				if weightNum~=nil then--if weightCheck is a number
					if weightNum >= 90 and weightNum <= 350 then
						charData:setCharWeight(weightNum)--sets weight if proper data has been entered
					else

						repeat--repeats until proper weight is input
							print("Incorrect input entered. ")
							print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
							weightCheck=io.read()--gets the weight information
							weightNum=tonumber(weightCheck)--converts weightCheck string to number


							while weightNum==nil do--ask for input again if a number was not entered. continues asking until a proper number is entered
								print("Incorrect input entered. ")
								print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
								weightCheck=io.read()--gets the weight information
								weightNum=tonumber(weightCheck)--converts weightCheck string to number
							end

						until weightNum>=90 and weightNum<=350

						charData:setCharWeight(WeightNum)--sets weight once proper data has been entered
					end
				else--if input was not a number

					repeat--repeats until proper weight is input
						print("Incorrect input entered. ")
						print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
						weightCheck=io.read()--gets the weight information
						weightNum=tonumber(weightCheck)--converts weightCheck string to number


					while weightNum==nil do--asks for input again if a number was not entered. continues asking until a number is entred
						print("Incorrect input entered. ")
						print("How much does your character weigh? Please input a number between 90 and 350")--ask user for weight,allow them to input a number between 90 and 350
						weightCheck=io.read()--gets the weight information
						weightNum=tonumber(weightCheck)--converts weightCheck string to number
					end

					until weightNum>=90 and weightNum<=350
					charData:setCharWeight(weightNum)--setsCharWeight once proper data has been entered
				end
				print("Would you like to modify another attribute? Y/N : ")
				choice=io.read()--gets choice from user
				choiceLower=string.lower(choice)--sets choice to lowercase for checks


			elseif selection=="10" then --allow user to modify weapon
				print("Please select a weapon for your player- [1]sword, [2]staff, [3]magic grimoire \n [4] dagger, or [5] axe : ")
				print("Alternativly you may input 0 to have the character creator automatically select the best fit for your class. ")
				weaponTypeCheck=io.read()--gets the weaponType information

				if weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5" then
					if weaponTypeCheck=="1" then--set weaponType to sword
						charData:setWeaponType("sword")
					elseif weaponTypeCheck=="2" then--set weaponType to staff
						charData:setWeaponType("staff")
					elseif weaponTypeCheck=="3" then--set weaponType to magic grimoire
						charData:setWeaponType("magic grimoire")
					elseif weaponTypeCheck=="4" then --set weaponType to dagger
						charData:setWeaponType("dagger")
					else--set weaponType to axe
						charData:setWeaponType("axe")
					end

				elseif weaponTypeCheck=="0" then--selects the best weapon choice for the character class
					if charData:getClassSelection()=="mage" then--if classType is mage then sets weaponType to magic Grimoire
						charData:setWeaponType("magic grimoire")
					elseif charData:getClassSelection()=="paladin" then--if classType is paladin then sets weaponType to sword
						charData:setWeaponType("sword")
					else--else classType is cleric and weaponType is set to staff
						charData:setWeaponType("staff")
					end

				else

					repeat--repeats until proper weaponType is input
						print("Incorrect input entered.")
						print("Please select a weapon for your player- [1]sword, [2]staff, [3]magic grimoire \n [4] dagger, or [5] axe : ")
						print("Alternativly you may input 0 to have the character creator automatically select the best fit for your class. ")
						weaponTypeCheck=io.read()--gets the weaponType information
					until weaponTypeCheck=="0" or weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5"

					if weaponTypeCheck=="1" or weaponTypeCheck=="2" or weaponTypeCheck=="3" or weaponTypeCheck=="4" or weaponTypeCheck=="5" then
						if weaponTypeCheck=="1" then--set weaponType to sword
							charData:setWeaponType("sword")
						elseif weaponTypeCheck=="2" then--set weaponType to staff
							charData:setWeaponType("staff")
						elseif weaponTypeCheck=="3" then--set weaponType to magic grimoire
							charData:setWeaponType("magic grimoire")
						elseif weaponTypeCheck=="4" then --set weaponType to dagger
							charData:setWeaponType("dagger")
						else--set weaponType to axe
							charData:setWeaponType("axe")
						end

					else --selects the best weapon choice for the character class
						if charData:getClassSelection()=="mage" then--if classType is mage then sets weaponType to magic Grimoire
							charData:setWeaponType("magic grimoire")
						elseif charData:getClassSelection()=="paladin" then--if classType is paladin then sets weaponType to sword
							charData:setWeaponType("sword")
						else--else classType is cleric and weaponType is set to staff
							charData:setWeaponType("staff")
						end
					end


				end
				print("Would you like to modify another attribute? Y/N : ")
				choice=io.read()--gets choice from user
				choiceLower=string.lower(choice)--sets choice to lowercase for checks




			else
				print("Now commencing save to slot "..saveTrack:getCurrentSlot())
				save(charData)--saves character data
				print("Your character is complete! Please hit any key to return to main menu: ")
				io.read()
				startUp()
			end

	end
	if choiceLower=="n" then--if choiceLower==n(ensures user sees character is complete message)
		print("Now commencing save to slot "..saveTrack:getCurrentSlot())
		save(charData)--saves character data
		print("Your character is complete! Please hit any key to return to main menu: ")
		io.read()
		startUp()
	end
end

function save(charData)
--used to create file and save characters
	slotInUse=saveTrack:getCurrentSlot()
	if slotInUse==1 then--creates save file for first save
		charSave[1]=charData
		saveFile=assert(io.open("charSaves.txt", "a+"))
		info=saveFile:read("*all")--reads in file
		neededData=string.find(info,"save slot 1",1,'|.-|') --finds slot 1
		if neededData==nil then--if it doesnt already exist
		fileFormat(charData,saveFile)
		end

		local sFile = assert(io.open("charSaves.txt", "r")) --Reading.
		local lines = {}
		--lines for data
		local l=1--keeps track of what line is being read
		for line in sFile:lines() do
			--sets lines required for saving info for first save slot(avoids duplicates)
			if l==1 then
				lines[#lines + 1]=line
				l=l+1

			elseif l==2 then
				lines[#lines + 1] = charSave[1]:getName()--sets name in file
				l=l+1

			elseif l==3 then
				lines[#lines + 1] = charSave[1]:getHairColor()--sets hairColor in file
				l=l+1

			elseif l==4 then
				lines[#lines + 1] = charSave[1]:getEyeColor()--sets eyeColor in file
				l=l+1

			elseif l==5 then
				lines[#lines + 1] = charSave[1]:getSkinColor()--sets skinColor in file
				l=l+1

			elseif l==6 then
				lines[#lines + 1] = charSave[1]:getHeight()--sets height in file
				l=l+1

			elseif l==7 then
				lines[#lines + 1] = charSave[1]:getClassSelection()--sets classSelection in file
				l=l+1

			elseif l==8 then
				lines[#lines + 1] = charSave[1]:getGender()--sets gender in file
				l=l+1

			elseif l==9 then
				lines[#lines + 1] = charSave[1]:getAge()--sets charAge in file
				l=l+1

			elseif l==10 then
				lines[#lines + 1] = charSave[1]:getWeight()--sets charWeight in file
				l=l+1

			elseif l==11 then
				lines[#lines + 1] = charSave[1]:getWeaponType()--sets weaponType in file
				l=l+1

			else--stores rest of file
				lines[#lines + 1] = line
				l=l+1
			end
		end
		sFile:close()

		sFile = assert(io.open("charSaves.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()




	elseif slotInUse<=6 and slotInUse>1 then--if a save slot is open
		charSave[slotInUse]=charData
		saveFile=assert(io.open("charSaves2.txt", "a"))
		if slotInUse==2 then
			charSave[slotInUse]=charData
			saveFile=assert(io.open("charSaves2.txt", "a+"))
			info=saveFile:read("*all")--reads in file
			neededData=string.find(info,"save slot 2",1,'|.-|') --finds slot 2
			if neededData==nil then--if it doesnt already exist
				fileFormat(charData,saveFile)
			end
			local sFile = assert(io.open("charSaves2.txt", "r")) --Reading.
			local lines = {}
			--lines for data
			local l=1--used to keep track of current line
			for line in sFile:lines() do
			--sets lines required for saving info for second save slot(avoids duplicates)
				if l==1 then
					lines[#lines + 1]=line
					l=l+1

				elseif l==2 then
					lines[#lines + 1] = charSave[2]:getName()--sets name in file
					l=l+1

				elseif l==3 then
					lines[#lines + 1] = charSave[2]:getHairColor()--sets hairColor in file
					l=l+1

				elseif l==4 then
					lines[#lines + 1] = charSave[2]:getEyeColor()--sets eyeColor in file
					l=l+1

				elseif l==5 then
					lines[#lines + 1] = charSave[2]:getSkinColor()--sets skinColor in file
					l=l+1

				elseif l==6 then
					lines[#lines + 1] = charSave[2]:getHeight()--sets height in file
					l=l+1

				elseif l==7 then
					lines[#lines + 1] = charSave[2]:getClassSelection()--sets classSelection in file
					l=l+1

				elseif l==8 then
					lines[#lines + 1] = charSave[2]:getGender()--sets gender in file
					l=l+1

				elseif l==9 then
					lines[#lines + 1] = charSave[2]:getAge()--sets charAge in file
					l=l+1

				elseif l==10 then
					lines[#lines + 1] = charSave[2]:getWeight()--sets charWeight in file
					l=l+1

				elseif l==11 then
					lines[#lines + 1] = charSave[2]:getWeaponType()--sets weaponType in file
					l=l+1


				else--stores rest of file
					lines[#lines + 1] = line
					l=l+1
				end
			end
			sFile:close()

			sFile = assert(io.open("charSaves2.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()


		elseif slotInUse==3 then
				charSave[slotInUse]=charData
				saveFile=assert(io.open("charSaves3.txt", "a+"))
				info=saveFile:read("*all")--reads in file
				neededData=string.find(info,"save slot 3",1,'|.-|') --finds slot 3
				if neededData==nil then--if it doesnt already exist
					fileFormat(charData,saveFile)
					end

			local sFile = assert(io.open("charSaves3.txt", "r")) --Reading.
			local lines = {}
			--lines for data
			local l=1--used to keep track of current line for data storing purposes
			for line in sFile:lines() do
			--sets lines required for saving info for third save slot(avoids duplicates)
				if l==1 then
					lines[#lines + 1]=line
					l=l+1

				elseif l==2 then
					lines[#lines + 1] = charSave[3]:getName()--sets name in file
					l=l+1

				elseif l==3 then
					lines[#lines + 1] = charSave[3]:getHairColor()--sets hairColor in file
					l=l+1

				elseif l==4 then
					lines[#lines + 1] = charSave[3]:getEyeColor()--sets eyeColor in file
					l=l+1

				elseif l==5 then
					lines[#lines + 1] = charSave[3]:getSkinColor()--sets skinColor in file
					l=l+1

				elseif l==6 then
					lines[#lines + 1] = charSave[3]:getHeight()--sets height in file
					l=l+1

				elseif l==7 then
					lines[#lines + 1] = charSave[3]:getClassSelection()--sets classSelection in file
					l=l+1

				elseif l==8 then
					lines[#lines + 1] = charSave[3]:getGender()--sets gender in file
					l=l+1

				elseif l==9 then
					lines[#lines + 1] = charSave[3]:getAge()--sets charAge in file
					l=l+1

				elseif l==10 then
					lines[#lines + 1] = charSave[3]:getWeight()--sets charWeight in file
					l=l+1

				elseif l==11 then
					lines[#lines + 1] = charSave[3]:getWeaponType()--sets weaponType in file
					l=l+1


				else--stores rest of file
					 lines[#lines + 1] = line
					l=l+1
				end
			end
			sFile:close()

			sFile = assert(io.open("charSaves3.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()

		elseif slotInUse==4 then
			charSave[slotInUse]=charData
			saveFile=assert(io.open("charSaves4.txt", "a+"))
			info=saveFile:read("*all")--reads in file
			neededData=string.find(info,"save slot 4",1,'|.-|') --finds slot 4
			if neededData==nil then--if it doesnt already exist
				fileFormat(charData,saveFile)
			end
			local sFile = assert(io.open("charSaves4.txt", "r")) --Reading.
			local lines = {}
			--lines for data
			local l=1--used to keep track of current line for data storing purposes
			for line in sFile:lines() do
			--sets lines required for saving info for fourth save slot(avoids duplicates)
				if l==1 then
					lines[#lines + 1]=line
					l=l+1

				elseif l==2 then
					lines[#lines + 1] = charSave[4]:getName()--sets name in file
					l=l+1

				elseif l==3 then
					lines[#lines + 1] = charSave[4]:getHairColor()--sets hairColor in file
					l=l+1

				elseif l==4 then
					lines[#lines + 1] = charSave[4]:getEyeColor()--sets eyeColor in file
					l=l+1

				elseif l==5 then
					lines[#lines + 1] = charSave[4]:getSkinColor()--sets skinColor in file
					l=l+1

				elseif l==6 then
					lines[#lines + 1] = charSave[4]:getHeight()--sets height in file
					l=l+1

				elseif l==7 then
					lines[#lines + 1] = charSave[4]:getClassSelection()--sets classSelection in file
					l=l+1

				elseif l==8 then
					lines[#lines + 1] = charSave[4]:getGender()--sets gender in file
					l=l+1

				elseif l==9 then
					lines[#lines + 1] = charSave[4]:getAge()--sets charAge in file
					l=l+1

				elseif l==10 then
					lines[#lines + 1] = charSave[4]:getWeight()--sets charWeight in file
					l=l+1

				elseif l==11 then
					lines[#lines + 1] = charSave[4]:getWeaponType()--sets weaponType in file
					l=l+1


				else--stores rest of file
					lines[#lines + 1] = line
					l=l+1
				end
			end
			sFile:close()

			sFile = assert(io.open("charSaves4.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()


		elseif slotInUse==5 then
			charSave[slotInUse]=charData
			saveFile=assert(io.open("charSaves5.txt", "a+"))
			info=saveFile:read("*all")--reads in file
			neededData=string.find(info,"save slot 5",1,'|.-|') --finds slot 5
			if neededData==nil then--if it doesnt already exist
				fileFormat(charData,saveFile)
			end
			local sFile = assert(io.open("charSaves5.txt", "r")) --Reading.
			local lines = {}
			--lines for data
			local l=1--used to keep track of current line for data storing purposes
			for line in sFile:lines() do
			--sets lines required for saving info for fifth save slot(avoids duplicates)
				if l==1 then
					lines[#lines + 1]=line
					l=l+1

				elseif l==2 then
					lines[#lines + 1] = charSave[5]:getName()--sets name in file
					l=l+1

				elseif l==3 then
					lines[#lines + 1] = charSave[5]:getHairColor()--sets hairColor in file
					l=l+1

				elseif l==4 then
					lines[#lines + 1] = charSave[5]:getEyeColor()--sets eyeColor in file
					l=l+1

				elseif l==5 then
					lines[#lines + 1] = charSave[5]:getSkinColor()--sets skinColor in file
					l=l+1

				elseif l==6 then
					lines[#lines + 1] = charSave[5]:getHeight()--sets height in file
					l=l+1

				elseif l==7 then
					lines[#lines + 1] = charSave[5]:getClassSelection()--sets classSelection in file
					l=l+1

				elseif l==8 then
					lines[#lines + 1] = charSave[5]:getGender()--sets gender in file
					l=l+1

				elseif l==9 then
					lines[#lines + 1] = charSave[5]:getAge()--sets charAge in file
					l=l+1

				elseif l==10 then
					lines[#lines + 1] =charSave[5]:getWeight()--sets charWeight in file
					l=l+1

				elseif l==11 then
					lines[#lines + 1] = charSave[5]:getWeaponType()--sets weaponType in file
					l=l+1


				else--stores rest of file
					 lines[#lines + 1] = line
					l=l+1
				end
			end
			sFile:close()

			sFile = assert(io.open("charSaves5.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()


		else
			charSave[slotInUse]=charData
			saveFile=assert(io.open("charSaves6.txt", "a+"))
			info=saveFile:read("*all")--reads in file
			neededData=string.find(info,"save slot 6",1,'|.-|') --finds slot 6
			if neededData==nil then--if it doesnt already exist
				fileFormat(charData,saveFile)
			end
			local sFile = assert(io.open("charSaves6.txt", "r")) --Reading.
			local lines = {}
			--lines for data
			local l=1--used to keep track of current line for data storing purposes
			for line in sFile:lines() do
			--sets lines required for saving info for sixth save slot(avoids duplicates)
				if l==1 then
					lines[#lines + 1]=line
					l=l+1

				elseif l==2 then
					lines[#lines + 1] = charSave[6]:getName()--sets name in file
					l=l+1

				elseif l==3 then
					lines[#lines + 1] = charSave[6]:getHairColor()--sets hairColor in file
					l=l+1

				elseif l==4 then
					lines[#lines + 1] = charSave[6]:getEyeColor()--sets eyeColor in file
					l=l+1

				elseif l==5 then
					lines[#lines + 1] = charSave[6]:getSkinColor()--sets skinColor in file
					l=l+1

				elseif l==6 then
					lines[#lines + 1] = charSave[6]:getHeight()--sets height in file
					l=l+1

				elseif l==7 then
					lines[#lines + 1] = charSave[6]:getClassSelection()--sets classSelection in file
					l=l+1

				elseif l==8 then
					lines[#lines + 1] = charSave[6]:getGender()--sets gender in file
					l=l+1

				elseif l==9 then
					lines[#lines + 1] = charSave[6]:getAge()--sets charAge in file
					l=l+1

				elseif l==10 then
					lines[#lines + 1] = charSave[6]:getWeight()--sets charWeight in file
					l=l+1

				elseif l==11 then
					lines[#lines + 1] = charSave[6]:getWeaponType()--sets weaponType in file
					l=l+1


				else--stores rest of file
					lines[#lines + 1] = line
					l=l+1
				end
			end
			sFile:close()

			sFile = assert(io.open("charSaves6.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()

		end






		--append to file
	else--has user select  save slot to overwrite
		print("All save slots are in use. Please input a number(1-6) to overwrite or input anything else to cancel save." )
		choice=io.read()
		--all below will find the proper file to overwrite
		if choice=="1" then
			charSave[1]=charData--stores the charData in array and appends it to file
			local sFile = assert(io.open("charSaves.txt", "r")) --Reading.
			local lines = {}
			local l = 1--used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for first save slot
				if l==1 then
					lines[#lines + 1]=line
					l=l+1
				elseif l==2 then
					lines[#lines + 1] = charSave[1]:getName()--sets name in file
					l=l+1
				elseif l==3 then
					lines[#lines + 1] = charSave[1]:getHairColor()--sets hairColor in file
					l=l+1
				elseif l==4 then
					lines[#lines + 1] = charSave[1]:getEyeColor()--sets eyeColor in file
					l=l+1
				elseif l==5 then
					lines[#lines + 1] = charSave[1]:getSkinColor()--sets skinColor in file
					l=l+1
				elseif l==6 then
					lines[#lines + 1] = charSave[1]:getHeight()--sets height in file
					l=l+1
				elseif l==7 then
					lines[#lines + 1] = charSave[1]:getClassSelection()--sets classSelection in file
					l=l+1
				elseif l==8 then
					lines[#lines + 1] = charSave[1]:getGender()--sets gender in file
					l=l+1
				elseif l==9 then
					lines[#lines + 1] = charSave[1]:getAge()--sets charAge in file
					l=l+1
				elseif l==10 then
					lines[#lines + 1] = charSave[1]:getWeight()--sets charWeight in file
					l=l+1
				elseif l==11 then
					lines[#lines + 1] = charSave[1]getWeaponType()--sets weaponType in file
					l=l+1
				else--stores rest of file
					lines[#lines + 1] = line
					l=l+1
				end

			end
			sFile:close()

		sFile = assert(io.open("charSaves.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()



		elseif choice=="2" then
			charSave[2]=charData
				local sFile = assert(io.open("charSaves2.txt", "r")) --Reading.
			local lines = {}
			local l =1 --used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for first save slot
				if l==1 then
					lines[#lines + 1]=line
					l=l+1
				elseif l==2 then
					lines[#lines + 1] = charSave[2]:getName()--sets name in file
					l=l+1
				elseif l==3 then
					lines[#lines + 1] = charSave[2]:getHairColor()--sets hairColor in file
					l=l+1
				elseif l==4 then
					lines[#lines + 1] = charSave[2]:getEyeColor()--sets eyeColor in file
					l=l+1
				elseif l==5 then
					lines[#lines + 1] = charSave[2]:getSkinColor()--sets skinColor in file
					l=l+1
				elseif l==6 then
					lines[#lines + 1] = charSave[2]:getHeight()--sets height in file
					l=l+1
				elseif l==7 then
					lines[#lines + 1] = charSave[2]:getClassSelection()--sets classSelection in file
					l=l+1
				elseif l==8 then
					lines[#lines + 1] = charSave[2]:getGender()--sets gender in file
					l=l+1
				elseif l==9 then
					lines[#lines + 1] = charSave[2]:getAge()--sets charAge in file
					l=l+1
				elseif l==10 then
					lines[#lines + 1] = charSave[2]:getWeight()--sets charWeight in file
					l=l+1
				elseif l==11 then
					lines[#lines + 1] = charSave[2]getWeaponType()--sets weaponType in file
					l=l+1
				else--stores rest of file
					lines[#lines + 1] = line
					l=l+1
				end

			end
			sFile:close()

		sFile = assert(io.open("charSaves2.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()


		elseif choice=="3" then
			charSave[3]=charData
			local sFile = assert(io.open("charSaves3.txt", "r")) --Reading.
			local lines = {}
			local l = 1--used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for third save slot
				if l==1 then
					lines[#lines + 1]=line
				elseif l==2 then
					lines[#lines + 1] = charSave[3]:getName()--sets name in file
				elseif l==3 then
					lines[#lines + 1] = charSave[3]:getHairColor()--sets hairColor in file
				elseif l==4 then
					lines[#lines + 1] = charSave[3]:getEyeColor()--sets eyeColor in file
				elseif l==5 then
					lines[#lines + 1] = charSave[3]:getSkinColor()--sets skinColor in file
				elseif l==6 then
					lines[#lines + 1] = charSave[3]:getHeight()--sets height in file
				elseif l==7 then
					lines[#lines + 1] = charSave[3]:getClassSelection()--sets classSelection in file
				elseif l==8 then
					lines[#lines + 1] = charSave[3]:getGender()--sets gender in file
				elseif l==9 then
					lines[#lines + 1] = charSave[3]:getAge()--sets charAge in file
				elseif l==10 then
					lines[#lines + 1] = charSave[3]:getWeight()--sets charWeight in file
				elseif l==11 then
					lines[#lines + 1] = charSave[3]getWeaponType()--sets weaponType in file
				else--stores rest of file
					lines[#lines + 1] = line
				end
				l=l+1
			end
			sFile:close()
			startUp()

		sFile = assert(io.open("charSaves3.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()

		elseif choice=="4" then
			charSave[4]=charData
			local sFile = assert(io.open("charSaves4.txt", "r")) --Reading.
			local lines = {}
			local restOfFile
			local l = 1--used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for fourth save slot
				if l==1 then
					lines[#lines + 1]=line
				elseif l==2 then
					lines[#lines + 1] = charSave[4]:getName()--sets name in file
				elseif l==3 then
					lines[#lines + 1] = charSave[4]:getHairColor()--sets hairColor in file
				elseif l==4 then
					lines[#lines + 1] = charSave[4]:getEyeColor()--sets eyeColor in file
				elseif l==5 then
					lines[#lines + 1] = charSave[4]:getSkinColor()--sets skinColor in file
				elseif l==6 then
					lines[#lines + 1] = charSave[4]:getHeight()--sets height in file
				elseif l==7 then
					lines[#lines + 1] = charSave[4]:getClassSelection()--sets classSelection in file
				elseif l==8 then
					lines[#lines + 1] = charSave[4]:getGender()--sets gender in file
				elseif l==9 then
					lines[#lines + 1] = charSave[4]:getAge()--sets charAge in file
				elseif l==10 then
					lines[#lines + 1] = charSave[4]:getWeight()--sets charWeight in file
				elseif l==11 then
					lines[#lines + 1] = charSave[4]getWeaponType()--sets weaponType in file
				else--stores rest of file
					lines[#lines + 1] = line
				end
				l=l+1
			end
			sFile:close()

		sFile =assert( io.open("charSaves4.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()



		elseif choice=="5" then
			charSave[5]=charData
			local sFile = assert(io.open("charSaves5.txt", "r")) --Reading.
			local lines = {}
			local l = 1--used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for fifth save slot
				if l==1 then
					lines[#lines + 1]=line
				elseif l==2 then
					lines[#lines + 1] = charSave[5]:getName()--sets name in file
				elseif l==3 then
					lines[#lines + 1] = charSave[5]:getHairColor()--sets hairColor in file
				elseif l==4 then
					lines[#lines + 1] = charSave[5]:getEyeColor()--sets eyeColor in file
				elseif l==5 then
					lines[#lines + 1] = charSave[5]:getSkinColor()--sets skinColor in file
				elseif l==6 then
					lines[#lines + 1] = charSave[5]:getHeight()--sets height in file
				elseif l==7 then
					lines[#lines + 1] = charSave[5]:getClassSelection()--sets classSelection in file
				elseif l==8 then
					lines[#lines + 1] = charSave[5]:getGender()--sets gender in file
				elseif l==9 then
					lines[#lines + 1] = charSave[5]:getAge()--sets charAge in file
				elseif l==10 then
					lines[#lines + 1] = charSave[5]:getWeight()--sets charWeight in file
				elseif l==11 then
					lines[#lines + 1] = charSave[5]getWeaponType()--sets weaponType in file
				else--stores rest of file
					lines[#lines + 1] = line
				end
				l=l+1
			end
			sFile:close()

		sFile = assert(io.open("charSaves5.txt", "w")) --write the file.
		for i, line in ipairs(lines) do
			sFile:write(line, "\n")
		end
		sFile:close()



		elseif choice=="6" then
			charSave[6]=charData
			local sFile = assert(io.open("charSaves6.txt", "r")) --Reading.
			local lines = {}
			local l = 1--used for keeping track of current line and data storing purposes
			for line in sFile:lines() do
			--sets lines required for overwriting info for sixth save slot
				if l==1 then
					lines[#lines + 1]=line
				elseif l==2 then
					lines[#lines + 1] =charSave[6]:getName()--sets name in file
				elseif l==3 then
					lines[#lines + 1] = charSave[6]:getHairColor()--sets hairColor in file
				elseif l==4 then
					lines[#lines + 1] = charSave[6]:getEyeColor()--sets eyeColor in file
				elseif l==5 then
					lines[#lines + 1] = charSave[6]:getSkinColor()--sets skinColor in file
				elseif l==6 then
					lines[#lines + 1] = charSave[6]:getHeight()--sets height in file
				elseif l==7 then
					lines[#lines + 1] = charSave[6]:getClassSelection()--sets classSelection in file
				elseif l==8 then
					lines[#lines + 1] = charSave[6]:getGender()--sets gender in file
				elseif l==9 then
					lines[#lines + 1] = charSave[6]:getAge()--sets charAge in file
				elseif l==10 then
					lines[#lines + 1] = charSave[6]:getWeight()--sets charWeight in file
				elseif l==11 then
					lines[#lines + 1] = charSave[6]getWeaponType()--sets weaponType in file
				else--stores rest of file
					lines[#lines + 1] = line
				end
				l=l+1
			end
			sFile:close()

			sFile = assert(io.open("charSaves.txt", "w")) --write the file.
			for i, line in ipairs(lines) do
				sFile:write(line, "\n")
			end
			sFile:close()



		else
			print("Character was not saved.")

		end

	end


end

function fileFormat(charData,file)--used to format file
	file:write("save slot "..saveTrack:getCurrentSlot())
	file:write("\n"..charData:getName())
	file:write("\n"..charData:getHairColor())
	file:write("\n"..charData:getEyeColor())
	file:write("\n"..charData:getSkinColor())
	file:write("\n"..charData:getHeight())
	file:write("\n"..charData:getClassSelection())
	file:write("\n"..charData:getGender())
	file:write("\n"..charData:getAge())
	file:write("\n"..charData:getWeight())
	file:write("\n"..charData:getWeaponType())
	file:write("\n*")
	file:close()

end


function loadChar()
--used to load a character that the user selects
	print("Please select a save slot that you would like to load- input a number(1-6) : ")
	loadSlot=io.read()--get character that user would like to load


	if loadSlot=="1" then --get the proper lines from save slot 1 to * to get information needed
		saveFileRead=io.open("charSaves.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 1",1,'|.-|') --finds slot 1
		end
		if neededData==nil or saveFileRead==nil then--if save slot 1 is open/ save slot 1 cannot be found in file
			print("No Data exists in Slot 1.")
			if savFileRead~=nil then--if file exists
				saveFileRead:close()--closes saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for first save slot
				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[1]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(1)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="2" then--get the proper lines from save slot 2 to * to get information needed
	   --get info
		saveFileRead=io.open("charSaves2.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 2",1,'|.-|') --finds slot 2
		end
		if neededData==nil or saveFileRead==nil then--if save slot 2 is open/ save slot 2 cannot be found in file
			print("No Data exists in Slot 2.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves2.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for second save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[2]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(2)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="3" then--get the proper lines from save slot 3 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves3.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 3",1,'|.-|') --finds slot 3
		end
		if neededData==nil or saveFileRead==nil then--if save slot 3 is open/ save slot 3 cannot be found in file
			print("No Data exists in Slot 3.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves3.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for third save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[3]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(3)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="4" then --gets the proper lines from save slot 4 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves4.txt","r")
		neededData=nil
		if saveFileRead ~=nil then--if file exists
		info=saveFileRead:read("*all")--reads in file
		neededData=string.find(info,"save slot 4",1,'|.-|') --finds slot 4
		end
		if neededData==nil or saveFileRead==nil then--if save slot 4 is open/ save slot 4 cannot be found in file
			print("No Data exists in Slot 4.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves4.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for fourth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[4]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(4)
			saveFileRead:close()
			startUp()
		end



	elseif loadSlot=="5" then --get the proper lines from save slot 5 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves5.txt","r")
		neededData=nil
		if saveFileRead~=nil then --if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 5",1,'|.-|') --finds slot 5
		end
		if neededData==nil or saveFileRead==nil then--if save slot 5 is open/ save slot 5 cannot be found in file
			print("No Data exists in Slot 5.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves5.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for fifth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[5]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(5)
			saveFileRead:close()
			startUp()
		end



	elseif loadSlot=="6" then --get the proper lines from save slot 6 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves6.txt","r")
		neededData=nil
		if saveFileRead~=nil then --if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 6",1,'|.-|') --finds slot 6
		end
		if neededData==nil or saveFileRead==nil then--if save slot 6 is open/ save slot 6 cannot be found in file
			print("No Data exists in Slot 6.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves6.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for sixth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[6]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(6)
			saveFileRead:close()
			startUp()
		end




	else

		repeat
		print("Inproper input entered.")
		print("Please select a save slot that you would like to load- input a number(1-6) : ")
		loadSlot=io.read()--get character that user would like to load
		until loadSlot=="1" or loadSlot=="2" or loadSlot=="3" or loadSlot=="4" or loadSlot=="5" or loadSlot=="6"



	if loadSlot=="1" then --get the proper lines from save slot 1 to * to get information needed
		saveFileRead=io.open("charSaves.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 1",1,'|.-|') --finds slot 1
		end
		if neededData==nil or saveFileRead==nil then--if save slot 1 is open/ save slot 1 cannot be found in file
			print("No Data exists in Slot 1.")
			if savFileRead~=nil then--if file exists
				saveFileRead:close()--closes saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for first save slot
				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[1]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(1)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="2" then--get the proper lines from save slot 2 to * to get information needed
	   --get info
		saveFileRead=io.open("charSaves2.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 2",1,'|.-|') --finds slot 2
		end
		if neededData==nil or saveFileRead==nil then--if save slot 2 is open/ save slot 2 cannot be found in file
			print("No Data exists in Slot 2.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves2.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for second save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[2]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(2)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="3" then--get the proper lines from save slot 3 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves3.txt","r")
		neededData=nil
		if saveFileRead~=nil then--if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 3",1,'|.-|') --finds slot 3
		end
		if neededData==nil or saveFileRead==nil then--if save slot 3 is open/ save slot 3 cannot be found in file
			print("No Data exists in Slot 3.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves3.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for third save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[3]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(3)
			saveFileRead:close()
			startUp()
		end


	elseif loadSlot=="4" then --gets the proper lines from save slot 4 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves4.txt","r")
		neededData=nil
		if saveFileRead ~=nil then--if file exists
		info=saveFileRead:read("*all")--reads in file
		neededData=string.find(info,"save slot 4",1,'|.-|') --finds slot 4
		end
		if neededData==nil or saveFileRead==nil then--if save slot 4 is open/ save slot 4 cannot be found in file
			print("No Data exists in Slot 4.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves4.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for fourth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[4]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(4)
			saveFileRead:close()
			startUp()
		end



	elseif loadSlot=="5" then --get the proper lines from save slot 5 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves5.txt","r")
		neededData=nil
		if saveFileRead~=nil then --if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 5",1,'|.-|') --finds slot 5
		end
		if neededData==nil or saveFileRead==nil then--if save slot 5 is open/ save slot 5 cannot be found in file
			print("No Data exists in Slot 5.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves5.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for fifth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[5]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(5)
			saveFileRead:close()
			startUp()
		end



	elseif loadSlot=="6" then --get the proper lines from save slot 6 to * to get information needed
		--get info
		saveFileRead=io.open("charSaves6.txt","r")
		neededData=nil
		if saveFileRead~=nil then --if file exists
			info=saveFileRead:read("*all")--reads in file
			neededData=string.find(info,"save slot 6",1,'|.-|') --finds slot 6
		end
		if neededData==nil or saveFileRead==nil then--if save slot 6 is open/ save slot 6 cannot be found in file
			print("No Data exists in Slot 6.")
			if saveFileRead~=nil then
				saveFileRead:close()--close saveFileRead
			end
			startUp()--returns to start menu
		else
			local sFile = assert(io.open("charSaves6.txt", "r")) --Reading.
			local lines = {}
			local l = 1
			charLoad=charCreate.create(" "," ","","","","","")
			for line in sFile:lines() do--gets lines required for loading info for sixth save slot

				if l==2 then
					charLoad:setName(line)--loads name
				elseif l==3 then
					charLoad:setHairColor(line)--loads hairColor
				elseif l==4 then
					charLoad:setEyeColor(line)--loads eyeColor
				elseif l==5 then
					charLoad:setSkinColor(line)--loads skinColor
				elseif l==6 then
					charLoad:setHeight(line)--loads height
				elseif l==7 then
					charLoad:setClassType(line)--loads class type
				elseif l==8 then
					charLoad:setGender(line)--loads gender
				elseif l==9 then
					charLoad:setCharAge(line)--loads age
				elseif l==10 then
					charLoad:setCharWeight(line)--loads weight
				elseif l==11 then
					charLoad:setWeaponType(line)--loads weaponType
				elseif l==12 then
					print("Your character has been loaded!")
				else
					--do nothing
				end
				charSave[6]=charLoad
				l=l+1
			end
			saveTrack:setCurrentSlot(6)
			saveFileRead:close()
			startUp()
		end
	end

	end

end

function fileInfo()--used to let the program know how many slots are in use
	number=0
	saves=nil
	while number~=nil do
		saves=io.open("charSaves.txt","r")
		save2=io.open("charSaves2.txt","r")
		save3=io.open("charSaves3.txt","r")
		save4=io.open("charSaves4.txt","r")
		save5=io.open("charSaves5.txt","r")
		save6=io.open("charSaves6.txt","r")
		if saves==nil then--if their are not save files
			saveTrack:setCurrentSlot(0)
			saveTrack:setOpenSlot(0)
			number=nil
			break;
		end
		if saves2==nil then
			saveTrack:setCurrentSlot(2)
			saveTrack:setOpenSlot(3)
			number=nil
			break;
		end
		if saves3==nil then
			saveTrack:setCurrentSlot(3)
			saveTrack:setOpenSlot(4)
			number=nil
			break;
		end
		if saves4==nil then
			saveTrack:setCurrentSlot(4)
			saveTrack:setOpenSlot(5)
			number=nil
			break;
		end
		if saves5==nil then
			saveTrack:setCurrentSlot(5)
			saveTrack:setOpenSlot(6)
			number=nil
			break;
		end
		if saves6==nil then
			saveTrack:setCurrentSlot(6)
			saveTrack:setOpenSlot(6)
			number=nil
			break;
		end
	end



end

function sim(choiceSel)--used to call proper functions for simulating attacking,healing, and defending with character
	if choiceSel=="1" then
		attack(charSave[saveTrack:getCurrentSlot()]:getName(),charSave[saveTrack:getCurrentSlot()]:getClassSelection(),charSave[saveTrack:getCurrentSlot()]:getWeaponType())--calls attack simulation function
		print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
		print("If you do not wish to simulate anything else please input 0.")
		print("Please input a number 0-3: ")
		local choice=io.read()--gets answer from user
		if choice=="1" or choice=="2" or choice=="3" then
			sim(choice)
		elseif choice=="0" then
			startUp()--if user does not wish to simulate anything else then return to main menu
		else
			repeat
				print("Incorrect input entered.")
				print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
				print("If you do not wish to simulate anything else please input 0.")
				print("Please input a number 0-3: ")
				local choice=io.read()--gets answer from user
			until choice=="1" or choice=="2" or choice=="3" or choice=="0"
			if choice=="1" or choice=="2" or choice=="3" then
				sim(choice)
			else
				startUp()--if user does not wish to simulate anything else then return to main menu
			end
		end


	elseif choiceSel=="2" then
		defend(charSave[saveTrack:getCurrentSlot()]:getName(),charSave[saveTrack:getCurrentSlot()]:getClassSelection(),charSave[saveTrack:getCurrentSlot()]:getWeaponType())--calls defend simulation function
		print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
		print("If you do not wish to simulate anything else please input 0.")
		print("Please input a number 0-3: ")
		local choice=io.read()--gets answer from user
		if choice=="1" or choice=="2" or choice=="3" then
			sim(choice)
		elseif choice=="0" then
			startUp()--if user does not wish to simulate anything else then return to main menu
		else
			repeat
				print("Incorrect input entered.")
				print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
				print("If you do not wish to simulate anything else please input 0.")
				print("Please input a number 0-3: ")
				local choice=io.read()--gets answer from user
			until choice=="1" or choice=="2" or choice=="3" or choice=="0"
			if choice=="1" or choice=="2" or choice=="3" then
				sim(choice)
			else
				startUp()--if user does not wish to simulate anything else then return to main menu
			end
		end


	else
		heal(charSave[saveTrack:getCurrentSlot()]:getName(),charSave[saveTrack:getCurrentSlot()]:getClassSelection(),charSave[saveTrack:getCurrentSlot()]:getWeaponType() )--calls healing simulation function
		print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
		print("If you do not wish to simulate anything else please input 0.")
		print("Please input a number 0-3: ")
		local choice=io.read()--gets answer from user
		if choice=="1" or choice=="2" or choice=="3" then
			sim(choice)
		elseif choice=="0" then
			startUp()--if user does not wish to simulate anything else then return to main menu
		else
			repeat
				print("Incorrect input entered.")
				print("If you would like to simluate something else please input- \n1. Attacking ,2. Defending 3. Healing. ")----ask user if they would like to simulate anything else
				print("If you do not wish to simulate anything else please input 0.")
				print("Please input a number 0-3: ")
				local choice=io.read()--gets answer from user
			until choice=="1" or choice=="2" or choice=="3" or choice=="0"
			if choice=="1" or choice=="2" or choice=="3" then
				sim(choice)
			else
				startUp()--if user does not wish to simulate anything else then return to main menu
			end
		end
	end
end


fileInfo()--calls fileInfo function to get the currentSlot and openSlots
startUp()--calls startUp function to display interface to user
