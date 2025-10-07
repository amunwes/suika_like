extends CharacterBody2D

@export var move_speed : float = 200
var input_direction : Vector2 = Vector2.ZERO
var screen_boundary : PackedVector2Array 

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size = get_viewport_rect().size
	var player_size = $CollisionShape2D.shape.get_rect().size
	screen_boundary.append(Vector2.ZERO + player_size/2) 
	screen_boundary.append(screen_size - player_size/2) 
#	hide() # Replace with function body.
	


func _process(_delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()
	position = position.clamp(screen_boundary[0], screen_boundary[1])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var input_direction = Input.get_axis("move_left", "move_right")
#	if (input_direction):
#		velocity.x = input_direction * move_speed
##	var velocity = Vector2.ZERO # The player's movement vector.
##	if Input.is_action_pressed("move_right"):
##		velocity.x += 1
##	if Input.is_action_pressed("move_left"):
##		velocity.x -= 1
#
#	position += velocity * delta * move_speed
#	position = position.clamp(Vector2.ZERO, screen_size)

