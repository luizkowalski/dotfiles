#! /usr/bin/env ruby

require 'json'

bulb_address = "192.168.178.20 38899"
nc_command   = "nc -u -w 1 #{bulb_address}"

bulb_state    = `echo '{"method":"getPilot","params":{}}' | #{nc_command}`
toggled_state = !JSON.parse(bulb_state).dig("result", "state")

`echo '{"method":"setPilot","params":{"state":#{toggled_state}}}}}' | #{nc_command}`
