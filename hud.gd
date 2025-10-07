extends CanvasLayer

signal start_game
signal end_game

# Called when the node enters the scene tree for the first time.
func _ready():
	$Message.hide()
	$NameInput.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func show_message(text):
	$Message.text = text
	$Message.show()

func submit_name_score():
	$NameInput.show()

func update_score(score):
	$Score.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	$NameInput.hide()
	
	start_game.emit()

func _on_dead_zone_body_entered(_body):
	show_message("Game Over")	
	$MessageTimer.start()
	$NameInput.show()
	
	end_game.emit()
#	await $MessageTimer.timeout
	
# code to wait 1 second before proceeding
#	await get_tree().create_timer(1.0).timeout
#	$StartButton.show() 
