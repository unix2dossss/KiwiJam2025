extends Node2D

@onready var player1 = $"../HBoxContainer/SubViewportContainer/SubViewport/Player"
@onready var player2 = $"../HBoxContainer/SubViewportContainer2/SubViewport2/Player2"

func _process(_delta):
	queue_redraw()

func _draw():
	if not player1 or not player2:
		return

	var viewport_transform1 = player1.get_viewport().get_screen_transform()
	var viewport_transform2 = player2.get_viewport().get_screen_transform()

	var p1_screen = viewport_transform1 * player1.global_position
	var p2_screen = viewport_transform2 * player2.global_position

	draw_line(p1_screen, p2_screen, Color.RED, 2.0)


#extends Node2D  # or Control
#
#@onready var player1 := get_node("../HBoxContainer/SubViewportContainer/SubViewport/Player")
#@onready var player2 := get_node("../HBoxContainer/SubViewportContainer2/SubViewport2/Player2")
#@onready var line := Line2D.new()
#
#func _ready():
	#add_child(line)
	#line.width = 4
	#line.default_color = Color(1, 0.6, 0.8)  # Soft pink
	#line.gradient = preload("res://string_gradient.tres")
	#
#func _process(_delta):
	#if player1 and player2:
		#var pos1 = player1.get_global_position()
		#var pos2 = player2.get_global_position()
		#print("Player1:", pos1, "Player2:", pos2)
#
		#line.points = [pos1, pos2]
#
#func _draw():
	#if not player1 or not player2:
		#return
#
	#var viewport_transform1 = player1.get_viewport().get_screen_transform()
	#var viewport_transform2 = player2.get_viewport().get_screen_transform()
#
	#var p1_screen = viewport_transform1 * player1.global_position
	#var p2_screen = viewport_transform2 * player2.global_position
#
	#draw_line(player1.global_position, player2.global_position, Color.RED, 2.0)
