extends CharacterBody2D

const speed: int = 100
var current_dir: String = "none"

func _ready() -> void:
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta: float) -> void:
	player_movement(delta)

func player_movement(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0 
	
	move_and_slide()

func play_anim(_movement: int) -> void:
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if _movement == 1:
			anim.play("side_walk")
		elif _movement == 0:
			anim.play("side_idle")
	
	if dir == "left":
		anim.flip_h = true
		if _movement == 1:
			anim.play("side_walk")
		elif _movement == 0:
			anim.play("side_idle")
	
	if dir == "down":
		anim.flip_h = true
		if _movement == 1:
			anim.play("front_walk")
		elif _movement == 0:
			anim.play("front_idle")
	
	if dir == "up":
		anim.flip_h = true
		if _movement == 1:
			anim.play("back_walk")
		elif _movement == 0:
			anim.play("back_idle")
