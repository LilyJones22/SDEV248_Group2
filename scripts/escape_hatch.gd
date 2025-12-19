extends Area2D



func _on_body_entered(body):
	if body.is_in_group("player"):
		call_deferred("exit", body)
		
func exit(body):
	body.queue_free()
	get_tree().change_scene_to_file("res://scenes/levels/cutscenes/success_cutscene.tscn")
