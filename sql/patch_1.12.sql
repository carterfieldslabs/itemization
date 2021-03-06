-- Patch 1.12 World DB Itemization Changes. 
-- To be applied on QA first for testing.

-- Zanza's Potent Potables
DELETE FROM `spell_mod` WHERE `Id` IN (24382, 24417, 24383);
UPDATE `quest_template` SET `ReqItemCount1` = 1 WHERE `entry` = 8243;
DELETE FROM `spell_disabled` WHERE `entry` = 24417;

-- Spawn of Azuregos, Kazzak 1.3
UPDATE `creature` SET `spawnFlags` = 0 WHERE id IN (6109, 12397);

-- Enable available game events
UPDATE `game_event` SET `disabled` = 0 WHERE `entry` IN
(
14, 15, 40,			-- Stranglethorn Fishing Extravaganza 1.7
4, 5, 100, 101, 	-- DarkMoon Faire 1.6
13,					-- Elemental Invasion 1.5
16, 38, 39,			-- Gurubashi Arena 1.5
18,					-- Call to arms: Alterac Valley 1.5
156, 159,			-- Dire Maul extra content(unchecked) 1.3
35, 36, 37,
42, 43, 44,			-- The Maul 1.3
66,					-- Dragons of Nightmare 1.8
161,				-- Patch 1.3
162,				-- Patch 1.4 | 1.5
163,				-- Patch 1.6
164,				-- Patch 1.7
165,				-- Patch 1.8
154,				-- Silithus @ 1.9 (unchecked)
166,				-- Patch 1.9
158,				-- 1.10 Patch : Recipes (unchecked)
160,				-- 1.10 Patch : t0.5 Quest Chain (unchecked)
167,				-- Patch 1.10
155,				-- Argent dawn @ 1.11 (unchecked)
168 				-- Patch 1.11 ? 1.12
);

-- Enable Alterac Valley 1.5
UPDATE `battleground_template` SET `MinLvl` = 51, `MaxLvl` = 60 WHERE `id` = 1;

-- Disable unavailable instances
-- ATTENTION! Requires update once events are implemented!
UPDATE `areatrigger_teleport` SET `required_level` = 61 WHERE `target_map` IN 
(
533,    -- Naxxramas 1.12
531,    -- AQ40 (Temple of AQ) 1.9
509	    -- AQ20 (Ruins of AQ) 1.9
);

-- Enable available instances
-- ATTENTION! Requires update once events are implemented!
UPDATE `areatrigger_teleport` SET `required_level` = 45 WHERE `target_map` = 429;    -- Dire Maul 1.3
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 469;    -- Blackwing Lair 1.6
UPDATE `areatrigger_teleport` SET `required_level` = 60 WHERE `target_map` = 309;    -- Zul'Gurub 1.7

-- Transition Patch For Pre-1.4 Mounts
	-- Undead
insert into npc_vendor value (4731,11559,0,0);
	-- Tauren
insert into npc_vendor value (3685,11547,0,0);
insert into npc_vendor value (3685,11548,0,0);
	-- Orc
insert into npc_vendor value (3362,11549,0,0);
insert into npc_vendor value (3362,11550,0,0);
	-- Troll
insert into npc_vendor value (7952,11545,0,0);
insert into npc_vendor value (7952,11546,0,0);
	-- Human
insert into npc_vendor value (384,11551,0,0);
insert into npc_vendor value (4885,11551,0,0);
insert into npc_vendor value (2357,11551,0,0);
insert into npc_vendor value (1460,11551,0,0);
insert into npc_vendor value (384,11552,0,0);
insert into npc_vendor value (4885,11552,0,0);
insert into npc_vendor value (2357,11552,0,0);
insert into npc_vendor value (1460,11552,0,0);
	-- Dwarf
insert into npc_vendor value (1261,11553,0,0);
insert into npc_vendor value (1261,11554,0,0);
	-- Elf
insert into npc_vendor value (4730,11555,0,0);
insert into npc_vendor value (4730,11556,0,0);
	-- Gnome
insert into npc_vendor value (7955,11557,0,0);
insert into npc_vendor value (7955,11558,0,0);
--  -----------------------------------------------------------
--  Insert mounts quests (transforms pre 1.4 mount to post 1.4)
--  -----------------------------------------------------------
insert into creature_questrelation value    (3685,7663);
insert into creature_involvedrelation value (3685,7663);
insert into creature_questrelation value    (3685,7662);
insert into creature_involvedrelation value (3685,7662);
insert into creature_questrelation value    (3362,7660);
insert into creature_involvedrelation value (3362,7660);
insert into creature_questrelation value    (3362,7661);
insert into creature_involvedrelation value (3362,7661);
insert into creature_questrelation value    (7952,7664);
insert into creature_involvedrelation value (7952,7664);
insert into creature_questrelation value    (7952,7665);
insert into creature_involvedrelation value (7952,7665);
insert into creature_questrelation value    ( 384,7677);
insert into creature_involvedrelation value ( 384,7677);
insert into creature_questrelation value    ( 384,7678);
insert into creature_involvedrelation value ( 384,7678);
insert into creature_questrelation value    (4885,7677);
insert into creature_involvedrelation value (4885,7677);
insert into creature_questrelation value    (4885,7678);
insert into creature_involvedrelation value (4885,7678);
insert into creature_questrelation value    (2357,7677);
insert into creature_involvedrelation value (2357,7677);
insert into creature_questrelation value    (2357,7678);
insert into creature_involvedrelation value (2357,7678);
insert into creature_questrelation value    (1460,7677);
insert into creature_involvedrelation value (1460,7677);
insert into creature_questrelation value    (1460,7678);
insert into creature_involvedrelation value (1460,7678);
insert into creature_questrelation value    (1261,7673);
insert into creature_involvedrelation value (1261,7673);
insert into creature_questrelation value    (1261,7674);
insert into creature_involvedrelation value (1261,7674);
insert into creature_questrelation value    (4730,7671);
insert into creature_involvedrelation value (4730,7671);
insert into creature_questrelation value    (4730,7672);
insert into creature_involvedrelation value (4730,7672);
insert into creature_questrelation value    (7955,7675);
insert into creature_involvedrelation value (7955,7675);
insert into creature_questrelation value    (7955,7676);
insert into creature_involvedrelation value (7955,7676);

-- Golemagg Loot Drop Rates & Faction Drop
update reference_loot_template set ChanceOrQuestChance = 20 where entry = 326158 and item in (18842, 17103, 17072);
update reference_loot_template set condition_id = 3 where entry = 326158 and item = 18824;
update reference_loot_template set condition_id = 2 where entry = 326158 and item = 18829;