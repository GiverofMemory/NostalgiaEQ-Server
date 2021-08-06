sub EVENT_SPAWN {
	#:: Create a proximity 100 units across, 50 units tall, without proxmity say
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50, $z - 25, $z + 25, 0);
}

sub EVENT_ENTER {
	#:: Match a 18018 - Dark Truth Guild Note
	if (plugin::check_hasitem($client, 18018)) {
		$client->Message(15, "The cold voice of a female echoes in your mind, 'Come to me, young Necromancer. I am Coriante Verisue. Read the note in your inventory and hand it to me so that you may begin on the path of the Necromancer. True power can be yours should you have the will to train in the necromantic arts.'");
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor Miragul. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
	}
#	elsif ($text=~/miragul/i) {
#		quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
#	}
	elsif ($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		#:: Give a 51121 - Tradeskill Basics : Volume I
		quest::summonitem(51121);
	}
	elsif ($text=~/second book/i) {
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		#:: Give a 51122 - Tradeskill Basics : Volume II
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	#:: Match a 18018 - Dark Truth Guild Note
	if (plugin::takeItems(18018 => 1)) {
		quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth. Once you are ready to begin your training please make sure that you see Shwara Volemo, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		#:: Give a 13551 - Dirt Soiled Robe*
		quest::summonitem(13551);
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(265, 100);	# + Heretics
		quest::faction(242, -100);	# - Deepwater Knights
		quest::faction(254, -100);	# - Gate Callers
		quest::faction(231, -100);	# - Craftkeepers
		quest::faction(233, -100);	# - Crimson Hands
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Match two 13068 - Bat Wing and two 13067 - Snake Fang
	elsif (plugin::takeItems(13068 => 2, 13067 => 2)) {
		quest::say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
		#:: Give a 15338 - Spell: Cavorting Bones
		quest::summonitem(15338); #Spell: Cavorting Bones
		#:: Set factions
		quest::faction(265, 1);		# + Heretics
		quest::faction(231, -1);	# - Craftkeepers
		quest::faction(233, -1);	# - Crimson Hands
		quest::faction(242, -1);	# - Deepwater Knights
		quest::faction(254, -1);	# - Gate Callers
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
