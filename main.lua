local hs = game:GetService("HttpService");
local renv = getrenv()._G;
local db = renv.Database;

local function ParseAssetId(data)
    local startIndex , endIndex = string.find(data , "%d+$");
    local assetId = string.sub(data , startIndex , endIndex);
    return tonumber(assetId);
end

local function FormatDBItems(db) 
    local items = {}
    
    for name , data in pairs(db) do
        local item = {};
        
        item["Name"] = name;
        item["DisplayName"] = data.Name or data.ItemName;
        item["Rarity"] = data.Rarity;
        item["AssetURL"] = "https://www.roblox.com/library/" .. ParseAssetId(data.Image);
        item["Type"] = data.Type or data.ItemType
        
        table.insert(items , item);
    end
    
    return items;
end

local function GetDBPets() 
    return FormatDBItems(db.Pets);
end

local function GetDBWeapons()
    return FormatDBItems(db.Weapons);
end

local function GetDBWeaponsByType(type) 
    local weapons = {};
    
    for index, weapon in ipairs(GetDBWeapons()) do
        if(weapon.Type == type) then
            table.insert(weapons , weapon);          
        end
    end
    
    return weapons;
end


local function GetDBGuns() 
    return GetDBWeaponsByType("Gun")
end

local function GetDBKnifes()    
    return GetDBWeaponsByType("Knife")
end

writefile("guns.json", hs:JSONEncode(GetDBGuns()))
writefile("knifes.json", hs:JSONEncode(GetDBKnifes()))
writefile("pets.json", hs:JSONEncode(GetDBPets()))
