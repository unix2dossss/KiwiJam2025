extends Node2D  # or Control

@onready var player1 = $"../HBoxContainer/SubViewportContainer/SubViewport/Player"
@onready var player2 = $"../HBoxContainer/SubViewportContainer2/SubViewport2/Player2"

func _process(_delta):
	queue_redraw()

func _draw():
	if not player1 or not player2:
		return

	#var viewport_transform1 = player1.get_viewport().get_screen_transform()
	#var viewport_transform2 = player2.get_viewport().get_screen_transform()
#
	#var p1_screen = viewport_transform1 * player1.global_position
	#var p2_screen = viewport_transform2 * player2.global_position

	draw_line(player1.global_position, player2.global_position, Color.RED, 2.0)
