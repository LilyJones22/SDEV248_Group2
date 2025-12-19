extends CharacterBody2D

@onready var rat = $"../../Player"

@export var speed: float = 100.0
@export var gravity: float = 900.0
@export var patrol_distance: float = 250.0

var attacking: bool
var start_x: float
var direction: int = -1

func _ready() -> void:
	attacking = false
	start_x = global_position.x
	$AnimatedSprite2D.play("walk")
	$AnimatedSprite2D.flip_h = direction < 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = speed * direction

	if abs(global_position.x - start_x) > patrol_distance:
		direction *= -1
		$AnimatedSprite2D.flip_h = direction < 0
		global_position.x += direction * 2

	move_and_slide()

func _on_hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("attack")
		attacking = true

func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("walk")
		attacking = false

func _on_animated_sprite_2d_animation_looped() -> void:
	if attacking:
		rat.take_damage(1)
