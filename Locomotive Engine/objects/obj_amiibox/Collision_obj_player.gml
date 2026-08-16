instance_destroy()
with other  {
	global.plushies[$ other.plush] = true
	global.points += 1000
	AddCombo(0, 6.75) 
	create_follower("plushie" + other.plush)
}