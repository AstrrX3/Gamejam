extends Node2D

@export var mult: float = 1

func _ready() -> void:
	$ColorRect/Label.text = "x" + str(mult)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("homosexual intercourse")
		Global.score = Global.score * mult
		Trans.trans("res://end_screen.tscn")
	if body.is_in_group("coin"):
		body.queue_free()
