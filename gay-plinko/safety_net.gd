extends Area2D

var force: Vector2 = Vector2 (0,-2000)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("got here")
		body.apply_impulse(force)
		$AnimationPlayer.play("new_animation")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
