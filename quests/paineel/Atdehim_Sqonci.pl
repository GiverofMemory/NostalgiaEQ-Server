sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Ah, greetings. I hope you are a student of the way of fear. Within this temple there are many who can teach you to harness your gifts. I am an instructor in the [rituals of fear].");
	}
	elsif ($text=~/rituals of fear/i) {
		quest::say("So you wish to learn, eh? I am working on a ritual to strike fear into the hearts of the other inhabitants of Odus. The reagents I require for this ritual are the doll of a Kerran priestess, the ichor of a giant wooly spider, your initiate symbol of Cazic-Thule, and a giant snake fang with which to carve my glyphs. Fetch me these components. We shall infect this land with fear, and I shall reward you with the station of disciple of this temple.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13716 - Kerran Doll, a 16989 - Ichor, a 1437 - Initiate Symbol of Cazic-Thule, and a 7005 - Giant Snake Fang
	if (plugin::takeItems(13716 => 1, 16989 => 1, 1437 => 1, 7005 => 1)) {
		quest::say("Excellent work, $name. You are well on your way to proving yourself worthy to serve Cazic Thule.");
		#:: Give a 1438 - Disciple Symbol of Cazic Thule
		quest::summonitem(1438);
		#:: Ding!
		quest::ding();
		#:: Grant a moderate amount of experience
		quest::exp(2000);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
