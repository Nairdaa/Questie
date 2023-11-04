-------------------------
--Import modules.
-------------------------
---@type QuestieQuest
local QuestieQuest = QuestieLoader:ImportModule("QuestieQuest");
---@type IsleOfQuelDanas
local IsleOfQuelDanas = QuestieLoader:ImportModule("IsleOfQuelDanas");
---@type QuestieOptions
local QuestieOptions = QuestieLoader:ImportModule("QuestieOptions");
---@type QuestieOptionsDefaults
local QuestieOptionsDefaults = QuestieLoader:ImportModule("QuestieOptionsDefaults");
---@type QuestieOptionsUtils
local QuestieOptionsUtils = QuestieLoader:ImportModule("QuestieOptionsUtils");
---@type QuestiePlayer
local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer");
---@type QuestieMenu
local QuestieMenu = QuestieLoader:ImportModule("QuestieMenu");
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")
---@type QuestieTooltips
local QuestieTooltips = QuestieLoader:ImportModule("QuestieTooltips");
---@type WorldMapButton
local WorldMapButton = QuestieLoader:ImportModule("WorldMapButton")
---@type QuestieCoords
local QuestieCoords = QuestieLoader:ImportModule("QuestieCoords");
---@type QuestieTracker
local QuestieTracker = QuestieLoader:ImportModule("QuestieTracker");
---@type QuestieShutUp
local QuestieShutUp = QuestieLoader:ImportModule("QuestieShutUp")

QuestieOptions.tabs.general = { ... }
local optionsDefaults = QuestieOptionsDefaults:Load()

local _GetAnnounceChannels
local _IsAnnounceDisabled

function QuestieOptions.tabs.general:Initialize()
    return {
        name = function() return l10n('General'); end,
        type = "group",
        order = 10,
        args = {
            questie_header = {
                type = "header",
                order = 1,
                name = function() return l10n('General Options'); end,
            },
            Spacer_A = QuestieOptionsUtils:Spacer(2.5),
            --Spacer_A = QuestieOptionsUtils:Spacer(3.9, (not Questie.IsTBC)),
            isleOfQuelDanasPhase = {
                type = "select",
                order = 3,
                width = 1.5,
                --hidden = (not Questie.IsTBC),
                values = IsleOfQuelDanas.localizedPhaseNames,
                style = 'dropdown',
                name = function() return l10n("Isle of Quel'Danas Phase") end,
                desc = function() return l10n("Select the phase fitting your realm progress on the Isle of Quel'Danas"); end,
                disabled = function() return (not Questie.IsWotlk) end,
                get = function() return Questie.db.profile.isleOfQuelDanasPhase; end,
                set = function(_, key)
                    Questie.db.profile.isleOfQuelDanasPhase = key
                    QuestieQuest:SmoothReset()
                end,
            },
            isleOfQuelDanasPhaseReminder = {
                type = "toggle",
                order = 3.1,
                --hidden = (not Questie.IsTBC),
                name = function() return l10n('Disable Phase reminder'); end,
                desc = function() return l10n("Enable or disable the reminder on login to set the Isle of Quel'Danas phase"); end,
                disabled = function() return (not Questie.IsWotlk) end,
                width = 1,
                get = function() return Questie.db.profile.isIsleOfQuelDanasPhaseReminderDisabled; end,
                set = function(_, value)
                    Questie.db.profile.isIsleOfQuelDanasPhaseReminderDisabled = value
                end,
            },
            Spacer_B = QuestieOptionsUtils:Spacer(3.5),
            level_options_group = {
                type = "group",
                order = 4,
                inline = true,
                name = function() return l10n('Quest Level Options'); end,
                args = {
                    level_text = {
                        type = "description",
                        order = 1,
                        name = function() return Questie:Colorize(l10n('By default, Questie only shows quests that are relevant for your level. You can change this behavior below.'), 'gray'); end,
                        fontSize = "small",
                    },
                    level_spacer = QuestieOptionsUtils:Spacer(2),
                    radio = {
                        order = 3.0,
                        type = "select",
                        style = "radio",
                        width = 3,
                        name = l10n("Which available quests should be displayed"),
                        values = {
                            [Questie.LOWLEVEL_NONE] = l10n("Show only quests granting experience (Default)"),
                            [Questie.LOWLEVEL_ALL] = l10n("Show all low level quests"),
                            [Questie.LOWLEVEL_OFFSET] = l10n("Show quests to a set level below the player"),
                            [Questie.LOWLEVEL_RANGE] = l10n("Show quests between two set levels"),
                        },
                        get = function () return Questie.db.profile.lowLevelStyle end,
                        set = function (_, value)
                            Questie.db.profile.lowLevelStyle = value
                            QuestieOptions.AvailableQuestRedraw();
                            Questie:Debug(Questie.DEBUG_DEVELOP, "Lowlevel Quests set to:", value)
                        end,
                    },
                    manualOffset = {
                        type = "range",
                        order = 3.1,
                        name = function() return l10n('Player level offset'); end,
                        desc = function()
                            return l10n('How many levels below your character to show. ( Default: %s )', optionsDefaults.profile.manualLevelOffset);
                        end,
                        width = 1.55,
                        min = 0,
                        max = 60 + 10 * GetExpansionLevel(),
                        step = 1,
                        disabled = function() return (Questie.db.profile.lowLevelStyle ~= Questie.LOWLEVEL_OFFSET) end,
                        get = function() return Questie.db.profile.manualLevelOffset end,
                        set = function(info, value)
                            Questie.db.profile.manualLevelOffset = value;
                            QuestieOptionsUtils:Delay(0.3, QuestieOptions.AvailableQuestRedraw, "manualLevelOffset set to " .. value)
                        end,
                    },
                    minLevelFilter = {
                        type = "range",
                        order = 3.2,
                        name = function() return l10n('Level from'); end,
                        desc = function() return l10n('Minimum quest level to show.'); end,
                        width = 1.55,
                        min = 0,
                        max = 60 + 10 * GetExpansionLevel(),
                        step = 1,
                        disabled = function() return (Questie.db.profile.lowLevelStyle ~= Questie.LOWLEVEL_RANGE) end,
                        get = function() return Questie.db.profile.minLevelFilter; end,
                        set = function(info, value)
                            if value > Questie.db.profile.maxLevelFilter then
                                value = Questie.db.profile.maxLevelFilter
                            end
                            Questie.db.profile.minLevelFilter = value;
                            QuestieOptionsUtils:Delay(0.3, QuestieOptions.AvailableQuestRedraw, "minLevelFilter set to " .. value)
                        end,
                    },
                    maxLevelFilter = {
                        type = "range",
                        order = 3.3,
                        name = function()
                            return l10n('Level to');
                        end,
                        desc = function()
                            return l10n('Maximum quest level to show.');
                        end,
                        width = 1.55,
                        min = 0,
                        max = 60 + 10 * GetExpansionLevel(),
                        step = 1,
                        disabled = function() return (Questie.db.profile.lowLevelStyle ~= Questie.LOWLEVEL_RANGE) end,
                        get = function(info) return Questie.db.profile.maxLevelFilter; end,
                        set = function(info, value)
                            if value < Questie.db.profile.minLevelFilter then
                                value = Questie.db.profile.minLevelFilter
                            end
                            Questie.db.profile.maxLevelFilter = value;
                            QuestieOptionsUtils:Delay(0.3, QuestieOptions.AvailableQuestRedraw, "maxLevelFilter set to " .. value)
                        end,
                    },
                },
            },
            map_spacer = QuestieOptionsUtils:Spacer(4.5),
            map_options_group = {
                type = "group",
                order = 5,
                inline = true,
                name = function() return l10n('Interface Options'); end,
                args = {
                    instantQuest = {
                        type = "toggle",
                        order = 5.1,
                        name = function() return l10n('Enable Instant Quest Text'); end,
                        desc = function() return l10n('Toggles the default Instant Quest Text option. This is just a shortcut for the WoW option in Interface.'); end,
                        width = 1.55,
                        get = function()
                            if GetCVar("instantQuestText") == '1' then
                                return true;
                            else
                                return false;
                            end
                        end,
                        set = function(info, value)
                            if value then
                                SetCVar("instantQuestText", 1);
                            else
                                SetCVar("instantQuestText", 0);
                            end
                        end,
                    },
                    mapShowHideEnabled = {
                        type = "toggle",
                        order = 5.2,
                        name = function() return l10n('Show Questie Map Button'); end,
                        desc = function() return l10n('Enable or disable the Show/Hide Questie Button on Map (May fix some Map Addon interactions).'); end,
                        width = 1.55,
                        get = function(info) return QuestieOptions:GetProfileValue(info); end,
                        set = function (info, value)
                            QuestieOptions:SetProfileValue(info, value)

                            WorldMapButton.Toggle(value)
                        end,
                    },
                    minimapButtonEnabled = {
                        type = "toggle",
                        order = 5.3,
                        name = function() return l10n('Enable Minimap Button'); end,
                        desc = function() return l10n('Enable or disable the Questie minimap button. You can still access the options menu with /questie.'); end,
                        width = 1.55,
                        get = function() return not Questie.db.profile.minimap.hide; end,
                        set = function(info, value)
                            Questie.db.profile.minimap.hide = not value;

                            if value then
                                Questie.minimapConfigIcon:Show("Questie");
                            else
                                Questie.minimapConfigIcon:Hide("Questie");
                            end
                        end,
                    },
                    minimapCoordinatesEnabled = {
                        type = "toggle",
                        order = 5.4,
                        name = function() return l10n('Show Minimap Coordinates'); end,
                        desc = function() return l10n("Place the Player's coordinates on the Minimap title."); end,
                        width = 1.55,
                        get = function(info) return QuestieOptions:GetProfileValue(info); end,
                        set = function (info, value)
                            QuestieOptions:SetProfileValue(info, value)

                            if not value then
                                QuestieCoords:ResetMinimapText();
                            end
                        end,
                    },
                    mapCoordinatesEnabled = {
                        type = "toggle",
                        order = 5.5,
                        name = function() return l10n('Show Map Coordinates'); end,
                        desc = function() return l10n("Place the Player's coordinates and Cursor's coordinates on the Map's title."); end,
                        width = 1.55,
                        get = function(info) return QuestieOptions:GetProfileValue(info); end,
                        set = function (info, value)
                            QuestieOptions:SetProfileValue(info, value)

                            if not value then
                                QuestieCoords.ResetMapText();
                            end
                        end,
                    },
                    mapCoordinatePrecision = {
                        type = "range",
                        order = 5.6,
                        name = function() return l10n('Map Coordinates Decimal Precision'); end,
                        desc = function() return l10n('How many decimals to include in the precision on the Map for Player and Cursor coordinates.\n(Default: %s)', optionsDefaults.profile.mapCoordinatePrecision); end,
                        width = 1.4,
                        min = 1,
                        max = 5,
                        step = 1,
                        disabled = function() return not Questie.db.profile.mapCoordinatesEnabled end,
                        get = function(info) return QuestieOptions:GetProfileValue(info); end,
                        set = function (info, value)
                            QuestieOptions:SetProfileValue(info, value)
                        end,
                    },
                },
            },
            social_spacer = QuestieOptionsUtils:Spacer(6),
            social_options_group = {
                type = "group",
                order = 7,
                inline = true,
                name = function() return l10n('Social Options'); end,
                args = {
                    filterQuestieAnnounce = {
                        type = "toggle",
                        order = 7.1,
                        name = function() return l10n('Questie ShutUp!'); end,
                        desc = function() return l10n('Remove all Questie chat messages coming from other players and disable sending your own.'); end,
                        disabled = function() return false end,
                        width = 1.7,
                        get = function () return Questie.db.profile.questieShutUp end,
                        set = function (_, value)
                            Questie.db.profile.questieShutUp = value
                            QuestieShutUp:ToggleFilters(value)
                        end,
                    },
                    questAnnounceChannel = {
                        type = "select",
                        order = 7.2,
                        values = _GetAnnounceChannels(),
                        style = 'dropdown',
                        disabled = function() return Questie.db.profile.questieShutUp end,
                        name = function() return l10n('Channels to announce in') end,
                        desc = function() return l10n('Announce quest updates to other players in your group'); end,
                        get = function() return Questie.db.profile.questAnnounceChannel; end,
                        set = function(_, key)
                            Questie.db.profile.questAnnounceChannel = key
                            Questie:Debug(Questie.DEBUG_DEVELOP, "Channels to announce changed to:", key)
                        end,
                    },
                    printLocalMessages = {
                        type = "toggle",
                        order = 7.3,
                        name = function() return l10n('Display announcements locally when outside of a group'); end,
                        desc = function() return l10n("Questie will print your progress messages to chat when not in a group. Other players will NOT be able to see this."); end,
                        disabled = function() return Questie.db.profile.questieShutUp end,
                        width = 2.5,
                        get = function () return Questie.db.profile.questAnnounceLocally end,
                        set = function (_, value)
                            Questie.db.profile.questAnnounceLocally = value
                            Questie:Debug(Questie.DEBUG_DEVELOP, "Quest announce locally changed to:", value)
                        end,
                    },
                    shareQuestsNearby = {
                        type = "toggle",
                        order = 7.4,
                        name = function() return l10n('Share quest progress with nearby players'); end,
                        desc = function() return l10n("Your quest progress will be periodically sent to nearby players. Disabling this doesn't affect sharing progress with party members."); end,
                        disabled = function() return false end,
                        width = 1.7,
                        hidden = true, -- does this even do anything anymore after YELL removed?
                        get = function () return not Questie.db.profile.disableYellComms end,
                        set = function (info, value)
                            Questie.db.profile.disableYellComms = not value
                            if not value then
                                QuestieLoader:ImportModule("QuestieComms"):RemoveAllRemotePlayers()
                            end
                        end,
                    },
                    questAnnounceTypes = {
                        type = "group",
                        order = 7.5,
                        inline = true,
                        name = function() return l10n('Types of updates to announce in chat'); end,
                        disabled = function() return _IsAnnounceDisabled() or Questie.db.profile.questieShutUp; end,
                        args = {
                            questAnnounceItems = {
                                type = "toggle",
                                order = 1,
                                name = function() return l10n('Items starting a quest'); end,
                                desc = function() return l10n('Announce looted items that start a quest to other players'); end,
                                width = 1.5,
                                get = function () return Questie.db.profile.questAnnounceItems; end,
                                set = function (_, value)
                                    Questie.db.profile.questAnnounceItems = value
                                    Questie:Debug(Questie.DEBUG_DEVELOP, "Items starting a quest changed to:", value)
                                end,
                            },
                            questAnnounceAccepted = {
                                type = "toggle",
                                order = 2,
                                name = function() return l10n('Quest accepted'); end,
                                desc = function() return l10n('Announce quest acceptance to other players'); end,
                                width = 1.5,
                                get = function () return Questie.db.profile.questAnnounceAccepted; end,
                                set = function (_, value)
                                    Questie.db.profile.questAnnounceAccepted = value
                                    Questie:Debug(Questie.DEBUG_DEVELOP, "Quest accepted announce changed to:", value)
                                end,
                            },
                            questAnnounceAbandoned = {
                                type = "toggle",
                                order = 3,
                                name = function() return l10n('Quest abandoned'); end,
                                desc = function() return l10n('Announce quest abortion to other players'); end,
                                width = 1.5,
                                get = function () return Questie.db.profile.questAnnounceAbandoned; end,
                                set = function (_, value)
                                    Questie.db.profile.questAnnounceAbandoned = value
                                    Questie:Debug(Questie.DEBUG_DEVELOP, "Quest abandoned announce changed to:", value)
                                end,
                            },
                            questAnnounceObjectives = {
                                type = "toggle",
                                order = 4,
                                name = function() return l10n('Objective completed'); end,
                                desc = function() return l10n('Announce completed objectives to other players'); end,
                                width = 1.5,
                                get = function () return Questie.db.profile.questAnnounceObjectives; end,
                                set = function (_, value)
                                    Questie.db.profile.questAnnounceObjectives = value
                                    Questie:Debug(Questie.DEBUG_DEVELOP, "Objective completed announce changed to:", value)
                                end,
                            },
                            questAnnounceCompleted = {
                                type = "toggle",
                                order = 5,
                                name = function() return l10n('Quest completed'); end,
                                desc = function() return l10n('Announce quest completion to other players'); end,
                                width = 1.5,
                                get = function () return Questie.db.profile.questAnnounceCompleted; end,
                                set = function (_, value)
                                    Questie.db.profile.questAnnounceCompleted = value
                                    Questie:Debug(Questie.DEBUG_DEVELOP, "Quest completed announce changed to:", value)
                                end,
                            },
                        },
                    },
                },
            },
            tooltip_spacer = QuestieOptionsUtils:Spacer(7.5),
            tooltip_options_group = {
                type = "group",
                order = 8,
                inline = true,
                name = function() return l10n('Tooltip Options'); end,
                args = {
                    enableTooltipsToggle = {
                        type = "toggle",
                        order = 8.1,
                        name = function() return l10n('Enable World Tooltips'); end,
                        desc = function() return l10n('When this is enabled, quest info will be added to relevant mob/item tooltips.'); end,
                        width = 1.5,
                        get = function () return Questie.db.profile.enableTooltips; end,
                        set = function (_, value) Questie.db.profile.enableTooltips = value end
                    },
                    questsInNpcTooltip = {
                        type = "toggle",
                        order = 8.2,
                        name = function() return l10n('Show quests in NPC tooltips'); end,
                        desc = function() return l10n('Show quests (available/complete) in the NPC tooltips.'); end,
                        width = 1.5,
                        disabled = function() return not Questie.db.profile.enableTooltips; end,
                        get = function () return Questie.db.profile.showQuestsInNpcTooltip; end,
                        set = function (_, value) Questie.db.profile.showQuestsInNpcTooltip = value end
                    },
                    showQuestLevels = {
                        type = "toggle",
                        order = 8.3,
                        name = function() return l10n('Show quest level in tooltips'); end,
                        desc = function() return l10n('When this is checked, the level of quests will show in the tooltips.'); end,
                        width = 1.5,
                        get = function() return Questie.db.profile.enableTooltipsQuestLevel; end,
                        set = function (_, value)
                            Questie.db.profile.enableTooltipsQuestLevel = value
                            if value and not Questie.db.profile.trackerShowQuestLevel then
                                Questie.db.profile.trackerShowQuestLevel = true
                                QuestieTracker:Update()
                            end
                        end
                    },
                    questXpAtMaxLevel = {
                        type = "toggle",
                        order = 8.4,
                        name = function() return l10n('Show quest XP at max level'); end,
                        desc = function() return l10n('Shows the quest XP values on quests even at max level.'); end,
                        width = 1.5,
                        get = function () return Questie.db.profile.showQuestXpAtMaxLevel; end,
                        set = function (_, value) Questie.db.profile.showQuestXpAtMaxLevel = value end
                    },
                    partyOnlyToggle = {
                        type = "toggle",
                        order = 8.5,
                        name = function() return l10n('Only show party members'); end,
                        desc = function() return l10n('When this is enabled, shared quest info will only show players in your party.'); end,
                        width = 1.5,
                        hidden = true, -- does this even do anything anymore after YELL removed?
                        get = function () return Questie.db.profile.onlyPartyShared; end,
                        set = function (_, value) Questie.db.profile.onlyPartyShared = value end
                    },
                },
            },
        },
    }
end

_GetAnnounceChannels = function()
    return {
        ['disabled'] = l10n('Disabled'),
        ['party'] = l10n('Party'),
        ['raid'] = l10n('Raid'),
        ['both'] = l10n('Both'),
    }
end

---@return boolean
_IsAnnounceDisabled = function()
    return (not Questie.db.profile.questAnnounceChannel) or (Questie.db.profile.questAnnounceChannel == "disabled")
end