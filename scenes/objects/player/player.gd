extends CharacterBody2D

const DELAY = 2.0  # seconds
var input_queue = []

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var time_now = Time.get_ticks_msec() / 1000.0
	
	var input = {
		"time": time_now,
		"jump": Input.is_action_just_pressed("jump"),
		"left": Input.is_action_pressed("left"),
		"right": Input.is_action_pressed("right")
	}
	input_queue.append(input)
	
	var to_remove = []
	for entry in input_queue:
		if time_now - entry["time"] >= DELAY:
			execute_input(entry)
			to_remove.append(entry)
	
	for entry in to_remove:
		input_queue.erase(entry)

func execute_input(entry):
	if entry["jump"] and is_on_floor():
		velocity.y = -400
	
	var direction = 0
	if entry["left"]:
		direction -= 1
	if entry["right"]:
		direction += 1
	velocity.x = direction * 200
	
	move_and_slide()
