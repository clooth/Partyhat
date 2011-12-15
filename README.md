# Partyhat
> Partyhat offers easy to use methods for Runescape-related apps.

## Installation

	gem install partyhat

or in bundler:

	gem "partyhat", "~> 0.0.1"

## Usage

### Basic utilities
Partyhat offers a variety of general utilities used across the whole gem, and these can be found in the `Partyhat::Util` module

#### Converting experience to level and vice-versa

	experience = 15000
	level      = Partyhat::Util.experience_to_level(experience) # => 53

	level      = 99
	experience = Partyhat::Util.level_to_experience(level)      # => 13034431

#### Shortening numbers and parsing the short versions

	number    = 1500000
	shortened = Partyhat::Util.shorten_number(number)  # => 1.5M

	shortened = "23.5M"
	number 	  = Partyhat::Util.parse_number(shortened) # => 23500000.0

### Skills, Activities and comparing
Pretty much any data of skills or activities in Partyhat is encapsulated within a class instance of the corresponding type.

#### Creating skill objects and comparing them
It also offers simple to use comparing methods for skills and activities. Initiating a new comparison gives you an object with the comparison results.

Results are calculated via the difference for the second to first. So level will return the difference of second-first, meaning negative values mean the first skill is better, except on ranks, where higher values means the first is higher (higher up in ranks, that is).

	skill1 = Partyhat::Skill.new(:attack, 99, 13034431, 1)
	skill2 = Partyhat::Skill.new(:attack, 97, 10692629, 3)

	skill_comparison = skill1.compare_to(skill2)
	skill_comparison.level 		# => -2 (skill2 is n levels lower)
	skill_comparison.experience # => -2341802 (skill2 is n amount of xp behind)
	skill_comparison.rank 		# => 1 (skill2 is n ranks lower)

Same goes for comparing activities, just the resulting values are obviously different:

	activity1 = Partyhat::Activity.new(:conquest, 5000, 34)
	activity2 = Partyhat::Activity.new(:conquest, 2384, 88)

	activity_comparison = activity1.compare_to(activity2)
	activity_comparison.score # => -2616 (activity2 has n less score)
	activity_comparison.rank  # => 54 (activity2 is n ranks lower)

### Highscores and players
Partyhat has a really easy to use highscores module, which exists in `Partyhat::Highscores`

#### Finding a player's stats by name

	stats = Partyhat::Highscores.find_player("Not Clooth")
	stats[:attack]       # => #<Partyhat::Skill:x @name=:attack, @level=81, @experience=2208951, @rank=250554>
	stats[:ba_attackers] # => #<Partyhat::Activity:x @name=:ba_attackers, @score=nil, @rank=nil>
As you can see, we use the `Partyhat::Skill` and `Partyhat::Activity` classes  in the returned stats hash for your convenience, so you can compare them and whatnot.

#### Player object
You can also save a player with its stats and name by creating a new `Partyhat::Player` instance:

	me = Partyhat::Player.new("Not Clooth")

This operation fetches the stats automatically and allows you to then access the stats and name afterwards.

	me.name 				# => "Not Clooth"
	me.stats[:attack].level # => 81

### Calculators
There is a combat calculator included in Partyhat, that you just give a player's stats hash to, and it calculates the combat level with them:

	combat = Partyhat::Calculators.combat(me.stats)
	combat[:level] # => 109.15
	combat[:remainders] # => {:strength_attack=>3, :defence_constitution=>4, :prayer_summoning=>7}

### Forums
Partyhat also offers a simple interface to parsing the Runescape official forums, that you can use the following ways:

	thread = Partyhat::Forums::ForumThread.new("13-14-933-63418737")
	thread.title # => "Behind The Scenes - December"
	thread.link  # => "http://services.runescape.com/m=forum/forums.ws?13,14,933,63418737"

After you have fetched the thread, you will have access to the posts of the thread (keep in mind only the first page is currently supported):

	thread.posts.first.author   # => "Mod Mark"
	thread.posts.first.posted   # => "01-Dec-2011 15:49:14"
	thread.posts.first.contents # => "…"

A small utility function is also available for validating QFC codes:

	Partyhat::Forums.valid_qfc? "13-14-933-6341873" # => true
	Partyhat::Forums.valid_qfc? "12333-4955"        # => false

== Contributing to partyhat
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2011 Clooth. See LICENSE.txt for
further details.

