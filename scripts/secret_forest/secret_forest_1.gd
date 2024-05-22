extends TileMap

# | Ordering
# Y Sort Enabled [on]
# Z index = 0

# | Tile Set
# .. layer - "nature"
# Z index = 1
#
#
# `TileSet` config on inside of `TileMap` settings
# > Physics Layers
# .. defines a physics layer to paint inside of tile assets 
#
#
# ... bottom bottom bottom footer (navigation settings for the actual assets)
# 
# | Paint
# Paint Properties: Z Index
# Set to 1
# All tiles should have the z index set to 1
#
# Paint properties: Physics Layer 0
# Adjust the boundaries of the object
#


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
