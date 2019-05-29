QuestieMap = {...}

qQuestIdFrames = {}

-- copypaste from old questie (clean up later)
QUESTIE_NOTES_CLUSTERMUL_HACK = 1; -- smaller numbers = less icons on map
QuestieMap.MapCache_ClutterFix = {};

function QuestieMap:DrawWorldMap(QuestID)

end

--Get the frames for a quest, this returns all of the frames
function QuestieMap:GetFramesForQuest(QuestId)
    frames = {}
    --If no frames exists or if the quest does not exist we just return an empty list
    if (qQuestIdFrames[QuestId]) then
        for i, name in ipairs(qQuestIdFrames[QuestId]) do
            table.insert(frames, _G[name])
        end
    end
    return frames
end

function QuestieMap:UnloadQuestFrames(QuestId)
    if(qQuestIdFrames[QuestId]) then
        for index, frame in ipairs(QuestieMap:GetFramesForQuest(QuestId)) do
            frame:Unload();
        end
        qQuestIdFrames[QuestId] = nil;
        Questie:Debug(DEBUG_DEVELOP, "[QuestieMap]: Unloading quest frames:", QuestId)
    end
end

function QuestieMap:rescaleIcons(iconScale)
    for qId, framelist in pairs(qQuestIdFrames) do
        for i, frameName in ipairs(framelist) do
            local frame = _G[frameName]
            if(frame.data) then
                if(frame.data.Icon == ICON_TYPE_AVAILABLE or frame.data.Icon == ICON_TYPE_COMPLETE) then
                    if(frame.miniMapIcon) then
                        frame.data.IconScale = Questie.db.global.availableMiniMapScale;
                    else
                        frame.data.IconScale = Questie.db.global.availableScale;
                    end
                    local scale = 16 * frame.data.IconScale;
                    frame:SetWidth(scale)
                    frame:SetHeight(scale)
                else
                    if(frame.miniMapIcon) then
                        frame.data.IconScale = Questie.db.global.objectiveMiniMapScale;
                    else
                        frame.data.IconScale = Questie.db.global.objectiveScale;
                    end
                    local scale = 16 * frame.data.IconScale;
                    frame:SetWidth(scale)
                    frame:SetHeight(scale)
                end
            end
        end
    end
end

--(Questie, Note, zoneDataAreaIDToUiMapID[Zone], coords[1]/100, coords[2]/100, HBD_PINS_WORLDMAP_SHOW_WORLD)

--A layer to keep the area convertion away from the other parts of the code
--coordinates need to be 0-1 instead of 0-100
--showFlag isn't required but may want to be Modified
function QuestieMap:DrawWorldIcon(data, AreaID, x, y, showFlag)
    if type(data) ~= "table" then
        error(MAJOR..": AddWorldMapIconMap: must have some data")
    end
    if type(AreaID) ~= "number" or type(x) ~= "number" or type(y) ~= "number" then
        error(MAJOR..": AddWorldMapIconMap: 'AreaID', 'x' and 'y' must be numbers "..AreaID.." "..x.." "..y.." "..showFlag)
    end
    if type(data.Id) ~= "number" or type(data.Id) ~= "number"then
        error(MAJOR.."Data.Id must be set to the quests ID!")
    end
    if zoneDataAreaIDToUiMapID[AreaID] == nil then
        --Questie:Error("No UiMapID for ("..tostring(zoneDataClassic[AreaID])..") :".. AreaID .. tostring(data.Name))
        return nil, nil
    end
    if(showFlag == nil) then showFlag = HBD_PINS_WORLDMAP_SHOW_WORLD; end
    if(floatOnEdge == nil) then floatOnEdge = true; end
    -- check clustering
    local xcell = math.floor((x * (QUESTIE_NOTES_CLUSTERMUL_HACK)));
    local ycell = math.floor((x * (QUESTIE_NOTES_CLUSTERMUL_HACK)));

    if QuestieMap.MapCache_ClutterFix[AreaID] == nil then QuestieMap.MapCache_ClutterFix[AreaID] = {}; end
    if QuestieMap.MapCache_ClutterFix[AreaID][xcell] == nil then QuestieMap.MapCache_ClutterFix[AreaID][xcell] = {}; end
    if QuestieMap.MapCache_ClutterFix[AreaID][xcell][ycell] == nil then QuestieMap.MapCache_ClutterFix[AreaID][xcell][ycell] = {}; end


    if (not data.ClusterId) or (not QuestieMap.MapCache_ClutterFix[AreaID][xcell][ycell][data.ClusterId]) then -- the reason why we only prevent adding to HBD is so its easy to "unhide" if we need to, and so the refs still exist

        --QuestieMap.MapCache_ClutterFix[AreaID][xcell][ycell][data.ObjectiveTargetId] = true
        local icon = QuestieFramePool:GetFrame()
        icon.data = data
        icon.x = x
        icon.y = y
        icon.AreaID = AreaID
        if AreaID then
            data.UiMapID = zoneDataAreaIDToUiMapID[AreaID];
        end

        local iconScale = 1
        local miniMapScale = 0.75
        if(data.Icon == ICON_TYPE_AVAILABLE or data.Icon == ICON_TYPE_COMPLETE) then
            iconScale = Questie.db.global.availableScale
            miniMapScale = Questie.db.global.availableMiniMapScale
        else
            iconScale = Questie.db.global.objectiveScale
            miniMapScale = Questie.db.global.objectiveMiniMapScale
        end
        icon.data.IconScale = iconScale;

        local glow = false;

        if glow then
            icon.texture:SetTexture("Interface\\Addons\\QuestieDev-QuestieClassic\\Icons\\glow.blp")-- because of how frames work, I cant seem to set the glow as being behind the note. So for now things are draw in reverse.
            if data.QuestData and data.QuestData.Color then
                icon.texture:SetVertexColor(data.QuestData.Color[1], data.QuestData.Color[2], data.QuestData.Color[3], 1);
            end
            icon.glowTexture:SetTexture(data.Icon) -- todo: implement .GlowIcon
            icon.glowTexture:SetVertexColor(1, 1, 1, 1);

            -- because of how frames work, I cant seem to set the glow as being behind the note. So for now things are draw in reverse.
            if data.IconScale ~= nil then
                local scale = 16 * data.IconScale;
                icon.glow:SetWidth(scale)
                icon.glow:SetHeight(scale)
                icon:SetWidth(scale + 2)
                icon:SetHeight(scale + 2)
            else
                icon.glow:SetWidth(16)
                icon.glow:SetHeight(16)
                icon:SetWidth(18)
                icon:SetHeight(18)
            end
            --Questie:Debug(DEBUG_SPAM, "[QuestieQuest]: AddWorldMapIconMap", icon, zoneDataAreaIDToUiMapID[AreaID], x/100, y/100, showFlag )
        else
            icon.texture:SetTexture(data.Icon) -- todo: implement .GlowIcon
            icon.texture:SetVertexColor(1, 1, 1, 1);
            -- because of how frames work, I cant seem to set the glow as being behind the note. So for now things are draw in reverse.
            if data.IconScale ~= nil then
                local scale = 16 * data.IconScale;
                icon:SetWidth(scale)
                icon:SetHeight(scale)
            else
                icon:SetWidth(16)
                icon:SetHeight(16)
            end
        end

        local iconMinimap = QuestieFramePool:GetFrame()
        iconMinimap:SetWidth(16*miniMapScale)
        iconMinimap:SetHeight(16*miniMapScale)
        iconMinimap.data = data
        iconMinimap.data.IconScale = miniMapScale;
        iconMinimap.x = x
        iconMinimap.y = y
        iconMinimap.AreaID = AreaID
        --data.refMiniMap = iconMinimap -- used for removing
        iconMinimap.texture:SetTexture(data.Icon)
        iconMinimap.texture:SetVertexColor(1, 1, 1, 1);
        --Are we a minimap note?
        iconMinimap.miniMapIcon = true;

        if(not iconMinimap.fadeLogic) then
            function iconMinimap:fadeLogic()
                if self.miniMapIcon and self.x and self.y and self.texture and self.texture.SetVertexColor and Questie and Questie.db and Questie.db.global and Questie.db.global.fadeLevel and HBD and HBD.GetPlayerZonePosition and QuestieFramePool and QuestieFramePool.euclid then
                    local playerX, playerY, playerInstanceID = HBD:GetPlayerZonePosition()
                    if(playerX and playerY) then
                        local distance = QuestieFramePool:euclid(playerX, playerY, self.x / 100, self.y / 100);
                        --Very small value before, hard to work with.
                        distance = distance * 10
                        local NormalizedValue = 1 / (Questie.db.global.fadeLevel or 1.5);
                        if(distance > 0.6) then
                            self.texture:SetVertexColor(1, 1, 1, (1 - NormalizedValue * distance) + 0.5)
                        else
                            self.texture:SetVertexColor(1, 1, 1, 1)
                        end
                    else
                        self.texture:SetVertexColor(1, 1, 1, 1)
                    end
                end
            end
            -- We do not want to hook the OnUpdate again!
            iconMinimap:SetScript("OnUpdate", function(frame)
                --Only run if these two are true!
                if(frame.fadeLogic and frame.miniMapIcon) then
                    frame:fadeLogic()
                end
            end)
        end

        HBDPins:AddMinimapIconMap(Questie, iconMinimap, zoneDataAreaIDToUiMapID[AreaID], x / 100, y / 100, true, floatOnEdge)
        HBDPins:AddWorldMapIconMap(Questie, icon, zoneDataAreaIDToUiMapID[AreaID], x / 100, y / 100, showFlag)
        if data.ClusterId then
            QuestieMap.MapCache_ClutterFix[AreaID][xcell][ycell][data.ClusterId] = true
        end
        if(qQuestIdFrames[data.Id] == nil) then
            qQuestIdFrames[data.Id] = {}
        end

        table.insert(qQuestIdFrames[data.Id], icon:GetName())
        table.insert(qQuestIdFrames[data.Id], iconMinimap:GetName())
        return icon, iconMinimap;
    end
    return nil, nil
end

--function QuestieMap:RemoveIcon(ref)
--	HBDPins:RemoveWorldMapIcon(Questie, ref)
--end


--DOES NOT WORK
--Temporary functions, will probably need to ge redone.
function QuestieMap:GetZoneDBMapIDFromRetail(Zoneid)
    --Need to manually fix the names above to match.
    for continentID, Zone in pairs(Map) do
        for ZoneIDClassic, NameClassic in pairs(zoneDataClassic) do
            if(Zone[Zoneid] == NameClassic) then
                return ZoneIDClassic
            end
        end
    end
    return nil --DunMorogh
end

--DOES NOT WORK
function QuestieMap:GetRetailMapIDFromZoneDB(Zoneid)
    --Need to manually fix the names above to match.
    for continentID, Zones in pairs(Map) do
        for ZoneIDRetail, NameRetail in pairs(Zones) do
            if(zoneDataClassic[Zoneid] == nil) then return nil; end
            if(NameRetail == zoneDataClassic[Zoneid]) then
                return continentID, ZoneIDRetail
            end
        end
    end
    return nil --DunMorogh
end

--DOES NOT WORK
function GetWorldContinentFromZone(ZoneID)
    if(Map[0][ZoneID] ~= nil)then
        return 0
    elseif(Map[1][ZoneID] ~= nil)then
        return 1
    end
end
