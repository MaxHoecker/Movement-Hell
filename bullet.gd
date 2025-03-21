extends AnimatedSprite2D

var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	position += velocity * delta
