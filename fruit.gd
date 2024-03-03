extends RigidBody2D

signal fruit_match

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
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


func set_state(newstate):
	state = newstate%size
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var mod = dict[keys[state]]
	$AnimatedSprite2D.animation = keys[state]
	$AnimatedSprite2D.scale = Vector2(mod,mod)
	$CollisionShape2D.scale = Vector2(mod,mod)
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
#need code to make the body fall straight and on collision with the same type combine into the next type

func _on_collision(body):
	if body.is_in_group("fruit"):
		if state == body.state and self.get_rid() < body.get_rid():
			var col_pos = (position + body.position)/ 2.0
			body.queue_free()
			queue_free()
			fruit_match.emit(col_pos, state+1 )
	
