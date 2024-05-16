extends Area2D

func _on_body_entered(body):
	body.direction.y *= -1
	var parent = body.get_parent()
	parent.totalBricks -= 1

	parent.todosBricks.append(self.global_position)

	if parent.totalBricks == 0:
		parent.new_brics(body)
		parent.totalBricks = 27
			

	self.queue_free()
	
	var sound_player = body.get_parent().get_node("AudioStreamPlayer2D")
	sound_player.play()
