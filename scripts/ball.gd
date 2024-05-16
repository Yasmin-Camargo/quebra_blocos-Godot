extends CharacterBody2D

var direction = Vector2.ZERO
var SPEED = 300.0

func _ready():
	direction.y = 1
	direction.x = [1,-1].pick_random()    
	
func _physics_process(delta): 
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()
