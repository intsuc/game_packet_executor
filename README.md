# GamePacketExecutor

GamePacketExecutor is a proof-of-concept datapack that executes tasks during waiting time within every tick.
It exploits the fact that game packets are handled only while waiting for the next tick or reloading resources.

## Game packets

Game packets are a packet that represents player interaction.
It can be handled by the following advancement triggers:

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
- `minecraft:tame_animal`
- `minecraft:used_ender_eye`
- `minecraft:villager_trade`

Note that triggers other than the above can be fired by other factors than game packets.
That is usually undesirable for task execution.

Some triggers will be fired by both game packets and others.
They could also be used as a game packet handler if we carefully filter out the non-game packet cases.

## Task representation

Tasks are represented as a closure to be stored in the task queue.
See [Defunctionalization](https://github.com/intsuc/Defunctionalization) for the details.

## Implementation notes

Tasks will be executed only when the above triggers are fired.
In other words, if there are no players on the server or the players don't fire the above triggers, tasks won't be executed at all.
In a practical implementation, we should have a fallback task executor to remedy such a situation.
