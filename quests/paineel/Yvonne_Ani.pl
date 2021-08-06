sub EVENT_SAY {   
	if ($text=~/hail/i) {
		quest::say("Welcome to my shop, $name.  Feel free to purchase whatever you need.  I am sure that I can fill those needs, as [the Seekers of the Dark Truth] generally keep me stocked and on my toes.");
	}
	elsif ($text=~/dark truth/i) {
		quest::say("Ah, so you wish to know about the Seekers? They are the guild of necromancers here in Paineel.  They are by far the most knowledgeable in the dark arts of all the known world.  They purchase a good many [herbs] from me.");
	}
	elsif ($text=~/herbs/i) {
		quest::say("The herbs the necromancers use typically have properties useful for the preservation of dead flesh.  Who knows what they use them for?");
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
