sub EVENT_SAY {
	if ($text=~/hail/i) {
	    quest::say("Hello.  Be careful what you say to Iva.  She has been rather touchy lately.  She seems as if she is waiting for something to happen.  What, I know not.");
    }
}

sub EVENT_ITEM {
	#:: Return unused items
	plugin::returnUnusedItems();
}
