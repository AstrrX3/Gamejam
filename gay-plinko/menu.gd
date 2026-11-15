extends Node2D

@onready var picture = $Button_Manager/tutorial/TextureRect

var images = [
	preload("res://Tut1.png"),
	preload("res://Tut2.png"),
	preload("res://Tut3.png"),
	preload("res://Tut4.png")
	]
	
var current_image = 0
var slideshow_active = false
# Called when the node enters the scene tree for the first time.
func _ready() :
	picture.hide()

var button_type = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) :
	pass

func _on_start_pressed() -> void:
	Trans.trans("res://test.tscn")
	


func _on_quit_pressed() :
	get_tree().quit()
	



func _on_tutorial_pressed() -> void:
	current_image = 0
	slideshow_active = true
	picture.texture = images[current_image]
	picture.show()
	
func _input(event):
	if slideshow_active and event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			current_image += 1

			if current_image >= images.size():
				picture.hide()
				slideshow_active = false
			else:
				picture.texture = images[current_image]
