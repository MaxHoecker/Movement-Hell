extends CanvasLayer


	
func update_enemy_damage(num):
	$"Enemy Damage".text = "Enemy: "+str(num)


func _on_player_hit(damage) -> void:
	$"Player Damage".text = "Player: "+str(damage)
