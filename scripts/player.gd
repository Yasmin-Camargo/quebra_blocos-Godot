extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var player_sprite = get_parent().get_node("Player/Sprite2D")
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if (direction == 1):
			var new_texture = preload("res://assets/bola1.png")
			player_sprite.texture = new_texture
		else:
			var new_texture = preload("res://assets/bola2.png")
			player_sprite.texture = new_texture
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()


func _on_area_2d_body_entered(body):
	body.direction.y *= -1
	body.direction.x *= -1
	
	var sound_player = get_parent().get_node("AudioStreamPlayer2D")
	sound_player.play()
