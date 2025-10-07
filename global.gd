extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	SilentWolf.configure({
		"api_key": "oztBUYwOC814vJJUoeRee5nkedPFJmwV8b21NJIK",
		"game_id": "suikalike",
		"log_level": 1
		})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
		})


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
