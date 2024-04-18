extends CharacterBody2D

var speed = 100
var acceleration = 2
var player_state

@export var inv:  Inv

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
	
	velocity = direction * speed
	
	if Input.is_action_pressed("shift"):
		velocity = velocity * acceleration
	else:
		velocity = velocity
	move_and_slide()
	play_anim(direction)

func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("up_walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("right_walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("down_walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("left_walk")

func player():
	pass

func collect(item):
	inv.insert(item)
