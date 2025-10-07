extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	$PanelContainer/VBoxContainer/VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	


func _on_resume_pressed():
	toggle_paused()


func _on_quit_pressed():
	get_tree().quit()



func _on_volume_slider_drag_ended(value_changed):
	AudioServer.set_bus_volume_db(0,linear_to_db($PanelContainer/VBoxContainer/VolumeSlider.value) )
	
	
func toggle_paused():
	get_tree().paused = !get_tree().paused
	# Toggle menu visibility
	visible = get_tree().paused

