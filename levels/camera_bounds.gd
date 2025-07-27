extends Node2D

@export var bounds_rect: Rect2 = Rect2(Vector2.ZERO, Vector2(640, 360))

func _draw():
	draw_rect(bounds_rect, Color(1, 0, 0, 0.3), false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
