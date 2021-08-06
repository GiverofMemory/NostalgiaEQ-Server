sub EVENT_SAY {   
	if ($text=~/hail/i) {
		quest::say("Greetings, $name.  You have found the only place to purchase liquor in this fine city.  It seems that many of my countrymen do not appreciate liquor as I do.  Fear not if you spill, I have plenty of [skeletal servants] to clean up the mess.");
	}
	elsif ($text=~/skeletal servants/i) {
		#:: Removed 'Don't try to harm them, though, they don't like that very much. Say, would you like to see something interesting?'
		quest::say("Can't you see, child?  These dead servants of mine are bussing tables and dancing!  They work incredibly cheaply.  Heh.");  
	}
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
