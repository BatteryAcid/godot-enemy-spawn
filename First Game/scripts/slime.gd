extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_ground = $RayCastGround
@onready var animated_sprite = $AnimatedSprite2D

func kill_slime():
	print("Kill slime")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_ground.is_colliding():
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false
		
		position.x += direction * SPEED * delta
	else:
		#position.y += 100 * delta
		position.y = lerp(position.y, position.y + (100 * delta), 0.8)
