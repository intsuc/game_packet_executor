#> game_packet_executor:handler/player_generates_container_loot
#
# @handles game_packet_executor:trigger/player_generates_container_loot

advancement revoke @s only game_packet_executor:trigger/player_generates_container_loot
function game_packet_executor:poll_task/
