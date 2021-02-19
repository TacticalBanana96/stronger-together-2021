extends Node

#player signals
signal collected_moon(name)
signal player_hit_meteor(name)

#moon signals
signal grabbed_by_player(name)
signal moon_hit_meteor(name)

#meteor signals
signal damage_done(amount)


#health
signal game_over()
signal health_updated(newHealth)

#score 
signal score_updated(newScore)
