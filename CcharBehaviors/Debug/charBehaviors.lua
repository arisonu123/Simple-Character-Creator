--Alison Taylor
--10/01/2015
--Character Behaviors-Defines functions for simulating attacking, defending, and healing done by characters made with character creator


--TODO: if time write different print outs based off of name,class,and weapon
function attack(name,class,weapon)
	if class=="mage" then
		if weapon=="sword" then
			print(name.." draws mana through the sword and casts a weak thunder I on the tiny rat.\nIt took 30 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="staff" then
			print(name.." has casted a mediocre thunder spell on the tiny rat. \nIt took 100 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="magic grimoire" then
			print(name.." has casted a strong fire I on the tiny rat. It took 200 damage.")
			behavior = CBehaviors(1)-- call C/C++ function
			print(behavior)         -- print result from the function call

		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger and casts a weak fire I on the tiny rat.\nIt took 60 damage.")
			behavior= CBehaviors(1)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and cast a weak blizzard I on the tiny rat. \nIt took 60 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)--print result from the function call
		end

	elseif class=="cleric" then
		if weapon=="sword" then
			print(name.." draws mana through the sword and casts a weak light beam on the tiny rat.\nIt took 10 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="staff" then
			print(name.." has casted a strong holy on the tiny rat. It took 80 damage.")
			behavior = CBehaviors(1) -- call C/C++ function
			print(behavior)

		elseif weapon=="magic grimoire" then
			print(name.." has casted a mediocre holy on the tiny rat. It took 40 damage.")
			behavior = CBehaviors(1)-- call C/C++ function
			print(behavior)         -- print result from the function call

		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger and casts a weak leaf storm on the tiny rat.\nIt took 5 damage.")
			behavior= CBehaviors(1)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and casts weak holy on the tiny rat. \nIt took 20 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)--print result from the function call
		end


	else--class is paladin
		if weapon=="sword" then
			print(name.." has used heavy swing on the tiny rat. It took 90 damage.")
			behavior = CBehaviors(1) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="staff" then
			print(name.." has landed a glancing blow on the tiny rat.\nIt took 3 damage.")
			behavior = CBehaviors(1) -- call C/C++ function
			print(behavior)

		elseif weapon=="magic grimoire" then
			print(name.." has used a weak weapon toss on the tiny rat. \nIt took 5 damage.")
			behavior = CBehaviors(1)-- call C/C++ function
			print(behavior)         -- print result from the function call

		elseif weapon=="dagger" then
			print(name.." uses sharp swing on the tiny rat.\nIt took 30 damage.")
			behavior= CBehaviors(1)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." has used a mediocre swing on the tiny rat \nIt took 45 damage.")
			behavior=CBehaviors(1)--call C/C++ function
			print(behavior)--print result from the function call
		end


	end
end

function defend(name, class,weapon)
	if class=="mage" then

		if weapon=="sword" then
			print(name.." draws mana through the sword and uses a weak mana wall. \nThey blocked 5% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="staff" then
			print(name.." has used a mediocre mana shield. \nThey blocked 20% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="magic grimoire" then
			print(name.." has used mana shield. \nThey blocked 40% of incoming damage from the tiny rat.")
			print(name.." took 60 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger and uses a weak mana shield. \nThey blocked 10% of incoming damage from the tiny rat.")
			behavior= CBehaviors(2)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and uses a weak virus. \nThey blocked 10% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)--print result from the function call
		end

	elseif class=="cleric" then


		if weapon=="sword" then
			print(name.." draws mana through the sword and uses a weak barrier. \nThey blocked 10% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="staff" then
			print(name.." has used solar shield. \nThey blocked 50% percent of incoming damage from the tiny rat.")
			print(name.." took 50 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)

		elseif weapon=="magic grimoire" then
			print(name.." has used a mediocre solar shield. \nThey blocked 25% of incoming damage from the tiny rat.")
			print(name.." took 60 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger and uses a weak solar shield. \nThey blocked 12% of incoming damage from the tiny rat.")
			behavior= CBehaviors(2)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and uses a weak moonlight shield. \nThey blocked 14% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)--print result from the function call
		end

	else

		if weapon=="sword" then
			print(name.." has used steel wall. \nThey blocked 70% of incoming damage from the tiny rat.")
			print(name.." took 30 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="staff" then
			print(name.." has used a weak wooden wall. \nThey blocked 15% percent of incoming damage from the tiny rat.")
			print(name.." took 50 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)

		elseif weapon=="magic grimoire" then
			print(name.." has used a weak leather wall. \nThey blocked 10% of incoming damage from the tiny rat.")
			print(name.." took 60 damage.")
			behavior = CBehaviors(2) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="dagger" then
			print(name.." has used a weak steel wall \nThey blocked 18% of incoming damage from the tiny rat.")
			behavior= CBehaviors(2)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." has used a mediocre steel wall \nThey blocked 35% of incoming damage from the tiny rat.")
			behavior=CBehaviors(2)--call C/C++ function
			print(behavior)--print result from the function call
		end

	end
end

function heal(name,class,weapon)
	if class=="mage" then
		print(name.." has used physick on themselves. \nThey healed themselves for 80 hp.")
		behavior = CBehaviors(3) -- call C/C++ function
		print(behavior)          -- print result from the function call
		if weapon=="sword" then
			print(name.." draws mana through the sword and uses a weak physick on themselves. \nThey healed themselves for 20 hp.")
			behavior=CBehaviors(3)--call C/C++ function
			print(behavior)		  --print result from the function call

		elseif weapon=="staff" then
			print(name.." has used a mediocre physick on themselves. \nThey healed themselves for 40 hp.")
			print(name.." took 50 damage.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)

		elseif weapon=="magic grimoire" then
			print(name.." has used a strong physick on themselves. \nThey healed themselves for 80 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call

		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger and uses a weak blessing. \nThey healed themselves for 18 hp.")
			behavior= CBehaviors(3)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and uses a weak prayer. \nThey healed themselves for 10 hp.")
			behavior=CBehaviors(3)--call C/C++ function
			print(behavior)--print result from the function call
		end
	elseif class=="cleric" then

		if weapon=="sword" then
			print(name.." draws mana through the sword and uses a weak Cure II on themselves. \nThey healed themselves for 75 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call

		elseif weapon=="staff" then
			print(name.." has used a strong Cure II on themselves. \nThey healed themselves for 300 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call

		elseif weapon=="magic grimoire" then
			print(name.." has used a mediocre Cure II on themselves. \nThey heled themselves for 150 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="dagger" then
			print(name.." draws mana through the dagger uses a weak heal. \nThey healed themselves for 40 hp.")
			behavior= CBehaviors(3)--call C/C++ function
			print(behavior)		   --print result from the function call

		else--weapon is axe
			print(name.." somehow manages to flow mana through the axe and uses a weak life elixir. \nThey healed themselves for 30 hp.")
			behavior=CBehaviors(3)--call C/C++ function
			print(behavior)--print result from the function call
		end
	else

		if weapon=="sword" then
			print(name.." has used a strong cure I on themselves. \nThey healed themselves for 120 hp")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call

		elseif weapon=="staff" then
			print(name.." has used a weak ointment on themselves. \nThey healed themselves for 25 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call

		elseif weapon=="magic grimoire" then
			print(name.." has used weak pally's prayer on themselves. \nThey healed themselves for 20 hp.")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call
		elseif weapon=="dagger" then
			print(name.." has used a weak cure I on themselves. \nThey healed themselves for 30 hp")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call
		else--weapon is axe
			print(name.." has used a mediocre cure I on themselves. \nThey healed themselves for 60 hp")
			behavior = CBehaviors(3) -- call C/C++ function
			print(behavior)          -- print result from the function call
		end
	end
end
