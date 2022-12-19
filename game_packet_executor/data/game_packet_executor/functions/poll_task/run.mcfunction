#> game_packet_executor:poll_task/run
#
# @within game_packet_executor:poll_task/

# We use quadratic queue for simplicity.
data remove storage game_packet_executor: task_tag
data modify storage game_packet_executor: task_tag set from storage game_packet_executor: tasks[0].tag

function #game_packet_executor:dispatch

data remove storage game_packet_executor: tasks[0]
