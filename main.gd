extends Node

@export var curr_fruit_state = randi_range(0,4)
@export var next_fruit_state = randi_range(0,4)
@export var fruit_scene: PackedScene
var curr_fruit
var next_fruit
var score = 0
# value for combining each fruit, key is fruit state
var scoring = {0:1, 1:3, 2:6, 3:10, 4:15, 5:21, 6:28, 7:36, 8:45, 9:55, 10:66}

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_fruit = get_node("CurrentFruit")
	next_fruit = get_node("NextFruit")
	_on_hud_end_game()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var pos = $Player.position + Vector2(0,40)
	curr_fruit.position = pos
	if Input.is_action_just_pressed("drop"):
#		var new_rect = curr_fruit.get_sprite_frames()

#		print(new_rect)
		spawn_fruit(pos, curr_fruit_state)
		curr_fruit_state = next_fruit_state
		curr_fruit.set_state(curr_fruit_state)
		next_fruit_state = randi_range(0,4)
		next_fruit.set_state(next_fruit_state)

func enable_game(state):
	set_process(state)
	$Player.set_process(state)
	
func spawn_fruit(pos, state):
	var fruit = fruit_scene.instantiate()
	fruit.set_state(state)
	fruit.position = pos
	fruit.fruit_match.connect(_on_fruit_fruit_match)
	add_child(fruit)
	
func _on_fruit_fruit_match(new_pos, new_state):
	call_deferred("spawn_fruit",new_pos, new_state)
	score= score+scoring[new_state-1]
	$Hud.update_score(score)

func _on_hud_end_game():
	enable_game(false)
	$Hud/StartButton.show() 

func _on_hud_start_game():
	get_tree().call_group("fruit", "queue_free")
	score = 0
	$Hud.update_score(score)
	enable_game(true) 
