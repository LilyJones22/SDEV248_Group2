extends CharacterBody2D

const SPEED := 200.0
const JUMP_VELOCITY := -400.0

var health = 3
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity") as float

func _ready() -> void:
	# Start in idle, facing right
	$AnimatedSprite2D.play("idle")
	$AnimatedSprite2D.flip_h = false


func _physics_process(delta: float) -> void:
	# --- GRAVITY ---
	if not is_on_floor():
		velocity.y += gravity * delta

	# --- HORIZONTAL INPUT ---
	var direction: int = 0

	if Input.is_action_pressed("move_right"):
		direction += 1
	if Input.is_action_pressed("move_left"):
		direction -= 1

	velocity.x = direction * SPEED

	# --- JUMP INPUT ---
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	_update_animation(direction)


func _update_animation(direction: int) -> void:
	var anim := $AnimatedSprite2D

	# Flip based on direction (only if actually moving)
	if direction < 0:
		anim.flip_h = true
	elif direction > 0:
		anim.flip_h = false

	# Choose animation
	if not is_on_floor():
		anim.play("jump")
	elif direction == 0:
		anim.play("idle")
	else:
		anim.play("run")

func take_damage(damage):
	if health > 0:
		var heart_name = "../HUD/Health/Heart" + str(health)
		var hit = get_node(heart_name)
		hit.queue_free()
		health -= damage
	elif health < 1:
		call_deferred("lose")
		
func lose():
	get_tree().change_scene_to_file("res://scenes/levels/cutscenes/failure_cutscene.tscn")
