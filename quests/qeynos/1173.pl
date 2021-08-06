sub EVENT_SPAWN {
	#:: Create a proximity, 80 units across, 200 units tall, without proximity say
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40, $z - 100, $z + 100, 0);
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Match waypoint 23
	if ($wp == 23) {
		#:: Create a proximity, 80 units across, 200 units tall, without proximity say
		quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40, $z - 100, $z + 100, 0);
	}
	#:: Match waypoint 1
	elsif ($wp == 1) {
		quest::clear_proximity();
	}
}
	
sub EVENT_ENTER {
	#:: Move client to Erud's Crossing (erudsxing)
	quest::movepc(98, 716.9, -1771.8, 3.2);
}
