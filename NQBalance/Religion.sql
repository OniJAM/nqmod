-- remove goddess of harvest until it gets fixed or we can access the DLL and fix it ourselves
DELETE FROM Beliefs WHERE BeliefType = 'BELIEF_GODDESS_OF_THE_HARVEST';

-- make god of craftsmen give +2 porduction
UPDATE ModifierArguments SET Value ='2' WHERE ModifierId = 'GOD_OF_CRAFTSMEN_STRATEGIC_MINE_PRODUCTION_MODIFIER' AND Name = 'Amount';

--increase god of war distance to 12 tiles
UPDATE RequirementArguments SET Value = '12' WHERE RequirementId = 'REQUIRES_PLOT_WITHIN_EIGHT_HOLY_SITE' AND Name = 'MaxRange';

--increase god of war to 100% of unit strenght in faith
UPDATE ModifierArguments SET Value = '100' WHERE ModifierId = 'GOD_OF_WAR_FAITH_KILLS_MODIFIER' AND Name ='PercentDefeatedStrength';

-- update stone circles to +4 faith
UPDATE ModifierArguments SET Value = '3' WHERE ModifierId = 'STONE_CIRCLES_QUARRY_FAITH_MODIFIER' AND Name = 'Amount';

--add barbarian villagers pantheon
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('BELIEF_INIT_RITES', 'LOC_BELIEF_INIT_RITES_NAME', 'LOC_BELIEF_INIT_RITES_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO Types (Type, Kind) VALUES ('BELIEF_INIT_RITES', 'KIND_BELIEF');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_INIT_RITES', 'BELIEF_BELIEF_INIT_RITES_CAMPGOLD');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER','MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD', 'ModifierId', 'BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER', 'ImprovementType', 'IMPROVEMENT_BARBARIAN_CAMP');

--dsgdsgsdgvbxcvsdfsdvz
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('BELIEF_ROYAL_HOSPITALITY', 'LOC_BELIEF_ROYAL_HOSPITALITY_NAME', 'LOC_BELIEF_ROYAL_HOSPITALITY_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO Types (Type, Kind) VALUES ('BELIEF_ROYAL_HOSPITALITY', 'KIND_BELIEF');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_ROYAL_HOSPITALITY', 'BELIEF_ROYAL_HOSPITALITY_ADDHOUSING');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_ROYAL_HOSPITALITY', 'BELIEF_ROYAL_HOSPITALITY_ADDAMENITES');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, RunOnce, Permanent) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDHOUSING','MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS', '1', '1');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDHOUSING_MODIFIER','MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING', 'CITY_HAS_PALACE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDHOUSING', 'ModifierId', 'BELIEF_ROYAL_HOSPITALITY_ADDHOUSING_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDHOUSING_MODIFIER', 'Amount', '2');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDAMENITES','MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDAMENITES_MODIFIER','MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY', 'CITY_HAS_PALACE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDAMENITES', 'ModifierId', 'BELIEF_ROYAL_HOSPITALITY_ADDAMENITES_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDAMENITES_MODIFIER', 'Amount', '1');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('CITY_HAS_PALACE', 'REQUIRES_CITY_HAS_PALACE');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_CITY_HAS_PALACE', 'BuildingType', 'BUILDING_PALACE');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('CITY_HAS_PALACE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_CITY_HAS_PALACE', 'REQUIREMENT_CITY_HAS_BUILDING');

--INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_ROYAL_HOSPITALITY_ADDHOUSING_MODIFIER', 'YieldType', 'YIELD_CULTURE');

/*

--update initiation rites to give a free envoy for clearing a camp
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('BELIEF_INIT_RITES', 'LOC_BELIEF_INIT_RITES_NAME', 'LOC_BELIEF_INIT_RITES_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO Types (Type, Kind) VALUES ('BELIEF_INIT_RITES', 'KIND_BELIEF');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_INIT_RITES', 'BELIEF_BELIEF_INIT_RITES_CAMPGOLD');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER','MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD', 'ModifierId', 'BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER', 'Amount', '4');






INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('PLOT_HAS_BARB_CAMP', 'REQUIRES_PLOT_HAS_BARB_CAMP');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLOT_HAS_BARB_CAMP', 'FeatureType', 'FEATURE_FOREST');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('PLOT_HAS_BARB_CAMP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_PLOT_HAS_BARB_CAMP', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD', 'ModifierId', 'BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER', 'Amount', '1000');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_BELIEF_INIT_RITES_CAMPGOLD_MODIFIER', 'YieldType', 'YIELD_CULTURE');
*/


-- add new panthoen god of the open sea
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA', 'LOC_BELIEF_GOD_OF_THE_OPEN_SEA_NAME', 'LOC_BELIEF_GOD_OF_THE_OPEN_SEA_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO Types (Type, Kind) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA', 'KIND_BELIEF');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA', 'BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE','MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE_MODIFIER','MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_BOAT_REQUIREMENTS');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('PLOT_HAS_BOAT_REQUIREMENTS', 'REQUIRES_PLOT_HAS_BOAT');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLOT_HAS_BOAT', 'ImprovementType', 'IMPROVEMENT_FISHING_BOATS');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('PLOT_HAS_BOAT_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_PLOT_HAS_BOAT', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE', 'ModifierId', 'BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE_MODIFIER', 'Amount', '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_GOD_OF_THE_OPEN_SEA_ADDBOATCULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE');















--BELOW IS HOW YOU ADD A NEW PANTHEON -- DONT FORGET TO ADD ICON STUFF TO RELIGIONSCREEN.LUA FILE YOU IDIOT!!!
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('BELIEF_FOREST_FAITH', 'LOC_BELIEF_FOREST_FAITH_NAME', 'LOC_BELIEF_FOREST_FAITH_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');
INSERT INTO Types (Type, Kind) VALUES ('BELIEF_FOREST_FAITH', 'KIND_BELIEF');
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('BELIEF_FOREST_FAITH', 'BELIEF_FOREST_FAITH_ADDFORESTFAITH');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_FOREST_FAITH_ADDFORESTFAITH','MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('BELIEF_FOREST_FAITH_ADDFORESTFAITH_MODIFIER','MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_REQUIREMENTS');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('PLOT_HAS_FOREST_REQUIREMENTS', 'REQUIRES_PLOT_HAS_FOREST');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQUIRES_PLOT_HAS_FOREST', 'FeatureType', 'FEATURE_FOREST');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('PLOT_HAS_FOREST_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_PLOT_HAS_FOREST', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_FOREST_FAITH_ADDFORESTFAITH', 'ModifierId', 'BELIEF_FOREST_FAITH_ADDFORESTFAITH_MODIFIER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_FOREST_FAITH_ADDFORESTFAITH_MODIFIER', 'Amount', '1');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('BELIEF_FOREST_FAITH_ADDFORESTFAITH_MODIFIER', 'YieldType', 'YIELD_FAITH');