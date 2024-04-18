extends Node2D

var object_tile = preload("res://apple_tree.tscn")
@onready var tilemap = $TileMap

func _ready():
	await get_tree().create_timer(1).timeout
	GenerateTrees(3)

func GenerateTrees(chance):
	for x in range(0, 256):
		for y in range(1, 256):
			var pos = Vector2i(x, y)
			if tilemap.get_cell_source_id(0, pos) == 0:
				if chance >= (randi() % 50):
					var instance = object_tile.instance()
					instance.position = tilemap.map_to_world(x, y) + Vector2(4, 4)
					$WorldGeneration.add_child(instance)
				else:
					pass
			else:
				pass
