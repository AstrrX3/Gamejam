extends Node2D
@onready var pinsound = $pinball

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_impulse((body.global_position - global_position).normalized() * 1600)
		$AnimationPlayer.play("bump")
		pinsound.play()
		if body.is_in_group("player"):
			Global.score += 2
	
