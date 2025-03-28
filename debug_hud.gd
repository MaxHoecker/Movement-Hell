extends CanvasLayer


func _on_player_hit(damage) -> void:
	$"Player Damage".text = "Health: "+str(damage)
	
func _on_enemy_killed() -> void:
	$Score.text = "Score: "+str($"/root/GlobalConfig".player_score)
