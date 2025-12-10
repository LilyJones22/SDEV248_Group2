extends CharacterBody2D

@export var speed: float = 100.0
@export var gravity: float = 900.0
@export var patrol_distance: float = 250.0

var start_x: float
var direction: int = -1

func _ready() -> void:
	start_x = global_position.x
	$AnimatedSprite2D.play("walk")
	$AnimatedSprite2D.flip_h = direction < 0
	$Hitbox.body_entered.connect(_on_hitbox_body_entered)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = speed * direction

	if abs(global_position.x - start_x) > patrol_distance:
		direction *= -1
		$AnimatedSprite2D.flip_h = direction < 0

	move_and_slide()

func _on_hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("attack")
		if body.has_method("take_damage"):
			body.take_damage(1)
