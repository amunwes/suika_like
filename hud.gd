extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	

func update_score(score):
	$Score.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_dead_zone_body_entered(body):
	show_message("Game Over")
	
	await $MessageTimer.timeout
	
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show() # Replace with function body. # Replace with function body.
