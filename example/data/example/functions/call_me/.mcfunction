#> example:call_me/
#
# @handles #game_packet_executor:dispatch

execute if data storage game_packet_executor: {task_tag: "example:call_me/"} run function example:call_me/run
