extends CanvasLayer

signal start_game


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over(success):
	if success:
		show_message("Yeah Hit")
	else:
		show_message("Fail")
		
	yield($MessageTimer, "timeout")
	$MessageTimer.stop()
	$MessageLabel.text = "hit the thing!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()



func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
