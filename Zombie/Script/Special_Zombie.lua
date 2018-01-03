-- Special Zombie
-- Author: Administrator
-- DateCreated: 12/13/2017 12:36:00 AM
--------------------------------------------------------------
print("ZombieLoaded")
--------------------------------------------------------------
function Special_Zombie_By_Kill(dplayerID:number, dunitID:number, aplayerID:number, aunitID:number)
	local kUnit		:table = nil;
	local xPlayer	:table = Players[aplayerID];
	kUnit = xPlayer:GetUnits():FindID(aunitID);

	local unitX = kUnit:GetX();
	local unitY = kUnit:GetY();
	local UnitNID = math.random(1,100);
	local pPlayer = Players[63];

	if (aplayerID == 63) then
		local pPlot = Map.GetPlot(unitX, unitY);
		if (not pPlot:IsWater() and GameInfo.Units[kUnit:GetType()].Domain == 'DOMAIN_LAND') then
			if (UnitNID > 31) then
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY);
			else 
				if (UnitNID > 30) then
					pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_TANK"].Index, unitX, unitY);
				else 
					if (UnitNID > 25) then
						pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
						pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_HUNTER"].Index, unitX, unitY);
					else
						if (UnitNID > 20) then
							pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
							pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SMOKER"].Index, unitX, unitY);
						else
							if (UnitNID > 15) then
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_CHARGER"].Index, unitX, unitY);
							else
								if (UnitNID > 10) then
									pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
									pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SPITTER"].Index, unitX, unitY);
								else
									if (UnitNID > 5) then
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_JOCKEY"].Index, unitX, unitY);
									else
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, unitX, unitY); 
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_BOOMER"].Index, unitX, unitY);
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

Events.UnitKilledInCombat.Add(Special_Zombie_By_Kill);

------------------------------------------------------------------------------------------------------------------------
function Barbarian_Zombie_By_Camp(unitX :number, unitY :number, eOwner :number)
	if (eOwner == 63) then
		print("removed",unitX,unitY);
		local locX;
		local locY;
		locX, locY = Barbarian_Zombie_plot_check(unitX,unitY);
		print("removed",locX,locY);

		local pPlayer = Players[63]; 
		pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
		Special_Zombie_Pick(locX, locY);
		Special_Zombie_Pick(locX, locY);
	end

end

Events.ImprovementRemovedFromMap.Add(Barbarian_Zombie_By_Camp);

--------------------------------------------------------------------------------
function Barbarian_Zombie_plot_check(locX :number, locY :number)
	for dx = -1, 1 do
		for dy = -1,1 do
			local otherPlot = Map.GetPlot(locX+dx, locY+dy);
			if(otherPlot) then
				if(otherPlot:GetUnitCount() == 0 and not otherPlot:IsUnit() and not otherPlot:IsMountain() and not otherPlot:IsWater() and not otherPlot:IsNaturalWonder()) then
					locX = locX+dx;
					locY = locY+dy;
					return locX,locY;
				end
			end
		end
	end 
end

-------------------------------------------------------------------------------
function Special_Zombie_Pick(locX :number, locY :number)
	local UnitNID = math.random(1,40);
	local pPlayer = Players[63];
	if (UnitNID > 32) then
		pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
		pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
	else
		if (UnitNID > 30) then
			pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_TANK"].Index, locX, locY);
		else 
			if (UnitNID > 25) then
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_HUNTER"].Index, locX, locY);
			else
				if (UnitNID > 20) then
					pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
					pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SMOKER"].Index, locX, locY);
				else
					if (UnitNID > 15) then
						pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
						pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_CHARGER"].Index, locX, locY);
					else
						if (UnitNID > 10) then
							pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
							pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SPITTER"].Index, locX, locY);
						else
							if (UnitNID > 5) then
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_JOCKEY"].Index, locX, locY);
							else
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, locX, locY); 
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_BOOMER"].Index, locX, locY);
							end
						end
					end
				end
			end
		end
	end
end
-------------------------------------------------------------------------------
function ZombiesOnCityConquered(capturerID, ownerID, cityID, cityX, cityY)
	
	if (capturerID == 63) then
		local pPlayer = Players[63];
		local oPlayer = Players[ownerID];
		local city = oPlayer:GetCities():FindID(cityID);
		local Pop = city:GetPopulation();
		local UnitNID;

		print(Pop);

		for i = 1,Pop do
			UnitNID = math.random(1,100);
			if (UnitNID > 31) then
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, cityX, cityY);
				pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE"].Index, cityX, cityY);
			else 
				if (UnitNID > 30) then
					pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_TANK"].Index, cityX, cityY);
				else 
					if (UnitNID > 25) then
						pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_HUNTER"].Index, cityX, cityY);
					else
						if (UnitNID > 20) then
							pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SMOKER"].Index, cityX, cityY);
						else
							if (UnitNID > 15) then
								pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_CHARGER"].Index, cityX, cityY);
							else
								if (UnitNID > 10) then
									pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_SPITTER"].Index, cityX, cityY);
								else
									if (UnitNID > 5) then
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_JOCKEY"].Index, cityX, cityY);
									else
										pPlayer:GetUnits():Create(GameInfo.Units["UNIT_ZOMBIE_BOOMER"].Index, cityX, cityY);
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.CityConquered.Add(ZombiesOnCityConquered);