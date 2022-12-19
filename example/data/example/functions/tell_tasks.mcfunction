#> example:tell_tasks

data modify storage game_packet_executor: tasks append value {tag: "example:call_me/"}
data modify storage game_packet_executor: tasks append value {tag: "example:call_me/"}
data modify storage game_packet_executor: tasks append value {tag: "example:call_me/"}
data modify storage game_packet_executor: tasks append value {tag: "example:call_me/"}

data modify storage game_packet_executor: tasks append value {tag: "example:print_int/", env: 0}
data modify storage game_packet_executor: tasks append value {tag: "example:print_int/", env: 1}
data modify storage game_packet_executor: tasks append value {tag: "example:print_int/", env: 2}
data modify storage game_packet_executor: tasks append value {tag: "example:print_int/", env: 3}
