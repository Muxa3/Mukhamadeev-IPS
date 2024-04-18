extends Node2D

@export _grid
@onready var tilemap = $WorldGeneration/TileMap
const trees = preload("res://apple_tree.tscn")

func _ready():
	for x in range(256):
		for y in range(256):
			var pos = Vector2i(x, y)
			var TileID = _grid[1].get(pos)
			if TileID == 0:
				var object = trees.instance()
				object.position = tilemap.map_to_world(cellpos) * tilemap.scale
				add_child(object)
				tilemap.set_cellv(pos, -1)
