extends AnimatedSprite2D

# shoots directly at player
# spawns in after a delay so player can kill
# spawns in waves
# bullets move faster than player's base movement, so firing is required
# boss fights with predictable patterns
# enemies move to pick up powerups i.e. riccochet, circle burst, tracking etc.
# needs to warn of shooting

@export var bullet_scene: PackedScene
var damage
@export var health: Health
signal death

func _ready() -> void:
	$BulletTimer.start()
	health.health = 10

func _on_bullet_timer_timeout():
	var bullet = bullet_scene.instantiate()
	var player = get_tree().get_nodes_in_group("player")[0]
	bullet.velocity = Vector2(player.global_position - global_position).normalized() * 300
	bullet.position = position
	add_sibling(bullet)
	
func recieved_damage(damage):
	pass

func _on_health_health_depleted() -> void:
	$"/root/GlobalConfig".player_score += 1
	death.emit()
	queue_free()
