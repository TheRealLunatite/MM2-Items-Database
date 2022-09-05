# MM2-Items-Database

# Main.lua
Execute ``main.lua`` in MM2 to retrieve every item's data from their database. The script will separate items of different types into their files: ``guns.json`` , ``knifes.json``, and ``pets.json``. For ``Synapse X``, the executor will save the files in ``YourExecutorDirectory/workspace``. For other executors, you must check the documentation of where it will store created files. 

# Pull Requests
Feel free to make a pull request if an item is missing from the repository files. 

## Item Object
```json
{
  "Type": "string",
  "DisplayName": "string", 
  "Name" : "string",
  "AssetURL" : "string",
  "Rarity" : "string"
}
```

Difference between ``DisplayName`` and ``Name``. ``Name`` is a unique item name while ``DisplayName`` is not. ``Name`` will always be used to distinguish items from their counterparts. 
