extends CanvasLayer


func _on_player_hit(damage) -> void:
	$"Player Damage".text = "Player: "+str(damage)


func _on_enemy_hit(damage) -> void:
	$"Enemy Damage".text = "Enemy: "+str(damage)
