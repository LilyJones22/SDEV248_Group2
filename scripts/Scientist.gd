extends Node2D

signal talked_to

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	$TalkArea.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("talk")
		print("Dr Godot: Security is malfunctioning. Head for the exit!")
		emit_signal("talked_to")
		# Jacob can connect this to a UI dialogue box later.
