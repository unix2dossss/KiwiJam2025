extends Node2D

@onready var level_root = $HBoxContainer/SubViewportContainer/SubViewport/LevelRoot

var levels = [
	"res://levels/Level1.tscn",
	"res://levels/Level2.tscn",
	"res://levels/Level3.tscn",
	"res://levels/Level4.tscn"
]

var current_level_index = 0

@onready var player1 = $HBoxContainer/SubViewportContainer/SubViewport/Player
@onready var player2 = $HBoxContainer/SubViewportContainer2/SubViewport2/Player2

var lovers_have_met = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_current_level()
	load_level("res://levels/Level1.tscn")
	var world = $HBoxContainer/SubViewportContainer/SubViewport.find_world_2d()
	$HBoxContainer/SubViewportContainer2/SubViewport2.world_2d = world
	
func load_current_level():
	if current_level_index >= levels.size():
		print("🎉 All levels complete!")
		return

	load_level(levels[current_level_index])
	
func load_level(level_path: String):
	free_children(level_root)
	var new_level = load(level_path).instantiate()
	level_root.add_child(new_level)
	
	# Look for spawn markers inside the new level
	var spawn1 = new_level.get_node_or_null("Player1Spawn")
	var spawn2 = new_level.get_node_or_null("Player2Spawn")
	
	if spawn1 and spawn2:
		$HBoxContainer/SubViewportContainer/SubViewport/Player.global_position = spawn1.global_position
		$HBoxContainer/SubViewportContainer2/SubViewport2/Player2.global_position = spawn2.global_position
	else:
		push_warning("Spawn points not found in level!")
		
	lovers_have_met = false
		

func free_children(node: Node):
	for child in node.get_children():
		child.queue_free()

func on_lovers_meet():
	await get_tree().create_timer(2.0).timeout  # optional delay to savor the moment
	current_level_index += 1
	load_current_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lovers_have_met:
		return
	
	var distance = player1.global_position.distance_to(player2.global_position)
	if distance < 16:
		lovers_have_met = true
		print("✨ Lovers meet across the fabric of spacetime ✨")
		on_lovers_meet()
