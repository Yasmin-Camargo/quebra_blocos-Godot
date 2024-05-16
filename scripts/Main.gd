extends Node2D

var totalBricks = 27
var todosBricks := []

func _on_top_body_entered(body):
	body.direction.y *= -1

func _on_left_body_entered(body):
	body.direction.x *= -1

func _on_right_body_entered(body):
	body.direction.x *= -1

func _on_down_body_entered(body):
	body.queue_free()
	var e = preload("res://scenes/ball.tscn").instantiate()
	e.global_position = Vector2(236, 269)
	add_child(e)

func new_brics(body):
	body.queue_free()
	var e2 = preload("res://scenes/ball.tscn").instantiate()
	e2.global_position = Vector2(236, 269)
	add_child(e2)
	
	for i in range(todosBricks.size()):
		var e = preload("res://scenes/brick.tscn").instantiate()
		e.global_position = todosBricks[i]
		add_child(e)
