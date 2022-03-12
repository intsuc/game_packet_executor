#> game_packet_executor:poll_task/
#
# @within game_packet_executor:handler/**

execute if data storage game_packet_executor: tasks[-1] run function game_packet_executor:poll_task/run
