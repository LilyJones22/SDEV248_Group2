extends Sprite2D

@onready var play = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play.play("new_animation")

func _on_animation_player_animation_finished(anim_name) -> void:
	if anim_name == "new_animation":
		match get_node("../").name:
			"Opening Cutscene":
				get_tree().change_scene_to_file("res://scenes/levels/Level1.tscn")
			_:
				get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")
