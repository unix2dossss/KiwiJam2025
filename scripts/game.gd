extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var world = $HBoxContainer/SubViewportContainer/SubViewport.find_world_2d()
	$HBoxContainer/SubViewportContainer2/SubViewport2.world_2d = world


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
