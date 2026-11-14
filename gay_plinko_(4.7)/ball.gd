extends RigidBody2D

@export var hardcap = 800
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$shotgun.rotcorrect = rotation_degrees
	if Input.is_action_just_pressed("shoot"):
		apply_impulse($shotgun.shoot())
	if linear_velocity.length() > hardcap:
		linear_velocity = linear_velocity.normalized() * (hardcap - 5)
		
