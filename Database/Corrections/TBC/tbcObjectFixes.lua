---@class QuestieTBCObjectFixes
local QuestieTBCObjectFixes = QuestieLoader:CreateModule("QuestieTBCObjectFixes")

---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")

function QuestieTBCObjectFixes:Load()
    local objectKeys = QuestieDB.objectKeys
    local zoneIDs = ZoneDB.zoneIDs

    return {
        [181697] = {
            [objectKeys.spawns] = {[zoneIDs.AZUREMYST_ISLE]={{33.7,74.4},{37,69.4},{37,69.5},{38,72},{38.2,69.4},{38.2,69.6},{38.8,74.4},{38.8,74.6},{39.9,69.5},{39.9,71.2},{39.9,71.5},{40,69.2},{41.3,67.1},{42.4,66.1},{42.4,68.8},{42.6,66},{42.6,68.9},{43.9,65.8},{44.4,69},{44.6,68.8},{44.8,70.4},{44.8,70.5},{46.3,66.3},{46.5,66.2},{48.3,64.9},{48.5,64.7},{49.3,61.9},{50.1,57.4},{50.1,57.5},{50.2,60.1},{50.3,63.3},{50.3,66.9},{50.4,63.5},{50.5,63.1},{51.1,64.7},{51.4,65.9},{51.5,66},{52.8,67},{54.4,64.4},{54.4,64.5},{54.5,64.4},{54.5,64.5},{55.4,62},{55.5,62.1},{55.7,63.9},{57,63.6},},},
        },
        [181746] = {
            [objectKeys.spawns] = {[zoneIDs.BLOODMYST_ISLE]={{38.5,22.5},{40.6,20.1},{44,22.5},{46.4,20.5},},},
            [objectKeys.zoneID] = zoneIDs.BLOODMYST_ISLE,
        },
        [181757] = {
            [objectKeys.spawns] = {[zoneIDs.AZUREMYST_ISLE]={{33.3,26.1},{33.4,26.7},{33.5,26.5},{33.6,26.4},{33.7,18.7},{33.9,15.5},{34.1,14.7},{34.8,22.1},{34.9,12},},},
            [objectKeys.zoneID] = zoneIDs.AZUREMYST_ISLE,
        },
        [181781] = {
            [objectKeys.spawns] = {[zoneIDs.BLOODMYST_ISLE]={{41,30},},},
            [objectKeys.zoneID] = zoneIDs.BLOODMYST_ISLE,
        },
        [182127] = {
            [objectKeys.spawns] = {[zoneIDs.AZUREMYST_ISLE]={{33.1,49.4},{33.2,41.8},{33.2,49.6},{34,46},{34.1,42.8},{34.4,49.2},{34.4,49.5},{34.6,49.4},{34.6,49.5},{34.9,41},{34.9,44.9},{35.5,52.4},{35.7,52.5},{36,38.5},{36.1,38.3},{36.8,51.4},{36.8,51.5},{37,50.3},{37.3,52.8},{37.4,43.1},{37.4,45},{37.5,44.8},{37.5,53.1},{37.6,43.1},{37.7,40.5},{37.8,40.1},{37.8,48.6},{38,38.3},{38.1,48.4},{38.8,40},{39.2,42.9},{39.3,51.2},{39.4,51.6},{39.5,51.6},{39.6,51.4},{39.8,45.3},{39.8,45.5},{40.2,40.1},{40.2,42.6},{40.4,42.4},{40.4,46.9},{40.5,42.4},{40.5,42.5},{40.5,46.9},},},
        },

        -- Below are fake objects
        [400000] = {
            [objectKeys.name] = "Mailbox",
            [objectKeys.questStarts] = {9672},
            [objectKeys.spawns] = {[zoneIDs.BLOODMYST_ISLE]={{55.2,59.2},},},
            [objectKeys.zoneID] = zoneIDs.BLOODMYST_ISLE,
        },
    }
end