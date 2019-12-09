extends Node2D


func new_game():
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready")
	#$Music.play()

func _on_StartTimer_timeout():
	$Player.active = true


func _on_HUD_start_game():
	new_game()


func _on_Player_shot_failed():
	$HUD.show_game_over(false)


func _on_Player_shot_hit():
	$HUD.show_game_over(true)
