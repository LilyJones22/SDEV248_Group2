extends Node2D

signal talked_to

func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _on_talk_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("talk")
		emit_signal("talked_to", true)

func _on_talk_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("idle")
		emit_signal("talked_to", false)

func _on_talked_to(talking) -> void:
	$Label.visible = talking
