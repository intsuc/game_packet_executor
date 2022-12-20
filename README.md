# <samp>game_packet_executor</samp>

![Minecraft-1.19.3](https://img.shields.io/badge/Minecraft-1.19.3-blue)

<samp>game_packet_executor</samp> is a proof-of-concept datapack that executes tasks during waiting time within every tick.
It exploits the fact that game packets are handled only while blocking the main thread (waiting for the next tick or reloading resources).

If there is not enough time until the next tick after one task is completed, the execution of another task will be delayed until the next tick up to 4 ticks.

## Game packets

Game packets are a packet that represents player interaction.
They can be handled by the following advancement triggers:

- `minecraft:brewed_potion`
- `minecraft:enchanted_item`
- `minecraft:filled_bucket`
- `minecraft:fishing_rod_hooked`
- `minecraft:item_used_on_block`
- `minecraft:placed_block`
- `minecraft:player_generates_container_loot`
- `minecraft:player_hurt_entity`
- `minecraft:player_interacted_with_entity`
- `minecraft:player_killed_entity`
- `minecraft:shot_crossbow`
- `minecraft:slept_in_bed`
- `minecraft:tame_animal`
- `minecraft:used_ender_eye`
- `minecraft:villager_trade`

The following triggers can be fired by factors other than game packets, which is unsuitable for task execution.

- `minecraft:allay_drop_item_on_block`
- `minecraft:avoid_vibration`
- `minecraft:bee_nest_destroyed`
- `minecraft:bred_animals`
- `minecraft:changed_dimension`
- `minecraft:channeled_lightning`
- `minecraft:construct_beacon`
- `minecraft:consume_item`
- `minecraft:cured_zombie_villager`
- `minecraft:effects_changed`
- `minecraft:enter_block`
- `minecraft:entity_hurt_player`
- `minecraft:entity_killed_player`
- `minecraft:fall_from_height`
- `minecraft:hero_of_the_village`
- `minecraft:inventory_changed`
- `minecraft:item_durability_changed`
- `minecraft:kill_mob_near_sculk_catalyst`
- `minecraft:killed_by_crossbow`
- `minecraft:levitation`
- `minecraft:lightning_strike`
- `minecraft:location`
- `minecraft:nether_travel`
- `minecraft:recipe_unlocked`
- `minecraft:ride_entity_in_lava`
- `minecraft:slide_down_block`
- `minecraft:started_riding`
- `minecraft:summoned_entity`
- `minecraft:target_hit`
- `minecraft:thrown_item_picked_up_by_entity`
- `minecraft:thrown_item_picked_up_by_player`
- `minecraft:tick`
- `minecraft:used_totem`
- `minecraft:using_item`
- `minecraft:voluntary_exile`

Some of the above triggers will be fired by both game packets and others.
They could also be used as a game packet handler if we carefully filter out the non-game packet cases.

## Task representation

Tasks are represented as a closure to be stored in the task queue.
See [Defunctionalization](https://github.com/intsuc/Defunctionalization) for the details.

## Implementation notes

Tasks will be executed only when the above triggers are fired.
In other words, if there are no players on the server or the players don't fire the above triggers, tasks won't be executed at all.
In a practical implementation, we should have a fallback task executor to remedy such a situation.
