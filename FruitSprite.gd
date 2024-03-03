extends AnimatedSprite2D

var dict = {"Cherry": 0.35, 
			"Strawberry":0.4,
			"Grape": 0.6,
			"Dekopon": 0.7,
			"Persimmon": 0.95,
			"Apple": 1.2,
			"Pear": 1.35,
			"Peach": 1.7,
			"Pineapple": 1.9,
			"Melon": 2.4,
			"Watermelon":2.8	
			}
var keys = dict.keys()
var size = dict.size()
@export var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_sprite()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_modifier():
	return dict[keys[state]]
	
func set_state(newstate):
	state = newstate%size
	update_sprite()
	
func update_sprite():
	var mod = dict[keys[state]]
	animation = keys[state]
	scale = Vector2(mod,mod)
