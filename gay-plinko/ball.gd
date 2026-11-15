extends RigidBody2D

@export var hardcap = 600
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$shotgun.rotcorrect = rotation_degrees
	if Input.is_action_just_pressed("shoot"):
		apply_impulse($shotgun.shoot())
	if Input.is_action_just_pressed("restart"):
		Trans.reload_scene()
		
func _integrate_forces(state):
	if state.linear_velocity.length()>hardcap:
		state.linear_velocity=state.linear_velocity.normalized()*hardcap


#func _on_area_2d_body_entered(body: Node2D) -> void:
	#$shotgun.charge = $shotgun.Mcharge
