

extends Node2D


var life_energy = 0
var life_per_click = 1
var life_per_second = 0

@onready var life_label = $CanvasLayer/LifeLabel


func _ready():
	update_ui()

func update_ui():
	life_label.text = "Life Energy: " + str(life_energy)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("clicked")
		life_energy += life_per_click
		update_ui()

func _on_Timer_timeout():
	life_energy += life_per_second
	update_ui()

func _on_UpgradeButton_pressed():
	if life_energy >= 10:
		life_energy -= 10
		life_per_second += 1
		update_ui()
		
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		print("GLOBAL CLICK")
