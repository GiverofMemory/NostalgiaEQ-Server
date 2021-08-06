sub EVENT_COMBAT {
	#:: Match combat state 1 - entered combat
	if ($combat_state == 1) {
		quest::say("Time to die, $name!");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Hail!  Please leave here immediately.  This no place for a common citizen");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
