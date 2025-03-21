extends CharacterBody2D


# upgrades to buy
# breaker attack, press button to burst damage, recharges over time
# bullet eater, damages/destroys enemy bullets, different bullets have different health
# bullet time, slow mo

var mouse_position
var arena_size # Size of the game window.
var damage = 1
@export var health: Health

var player_move_speed
var player_acceleration_scalar
var player_friction

var fire_velocity = Vector2.ZERO
var acceleration = Vector2.ZERO

signal hit

func _ready():
	arena_size = get_viewport_rect().size*2
	player_move_speed = $"/root/GlobalConfig".player_move_speed
	player_acceleration_scalar = $"/root/GlobalConfig".player_acceleration_scalar
	player_friction = $"/root/GlobalConfig".player_friction
	health.health = 100
  	
func _process(delta):
		
	mouse_position = get_local_mouse_position()
	rotation += mouse_position.angle()+PI
	
	var movement_velocity = process_movement()
	
	var acc = process_acceleration(rotation)
	fire_velocity += acc
	fire_velocity = fire_velocity * player_friction
	if fire_velocity.is_zero_approx():
		fire_velocity = Vector2.ZERO
	
	move_and_collide((movement_velocity+fire_velocity) * delta)

func process_movement():
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * player_move_speed
	return velocity
	
func process_acceleration(angle):
	var new_acc = Vector2.ZERO
	if Input.is_action_pressed("fire"):
		new_acc = Vector2.from_angle(angle)
		new_acc *= player_acceleration_scalar
	return new_acc
	
func recieved_damage(damage):
	hit.emit(health.get_health())
