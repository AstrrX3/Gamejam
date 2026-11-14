extends Node2D

var enemies: Array
@export var power = -700
@export var multeffect = 20
@export var knockback = 3
@export var reload = 0.8
@export var charge = 2
var rotcorrect = 0
var Mcharge = charge
var restime: float = 0
#the values are all over the place im so sorry TwT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	restime += delta
	if restime > reload:
		charge = Mcharge
	rotation_degrees = (global_position - get_global_mouse_position()).angle() * (180/PI) - 90 - rotcorrect #what in gods name is this supposed to be

func shoot():
	#idk why but local mouse position refuses to work correctly and 
	#im way too done with this to troubleshoot so we have this shit instead
	var dir = (get_global_mouse_position() - global_position).normalized()
	var mult: float = 1
	var vel: float
	if charge < 1:
		return Vector2 (0,0)
	charge -= 1
	restime = 0
	if $rotnod/RayCast2D.is_colliding():
		if $rotnod/RayCast2D.get_collider().is_in_group("wall"):
			mult += 5 / (global_position - $rotnod/RayCast2D.get_collision_point()).length()
			print(mult)
	for i in enemies.size():
		var who = enemies.get(i)
		who.hurt(dir * knockback, 1)
	vel = power * mult
	return dir * vel
