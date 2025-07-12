@tool
class_name Panorama
extends Node3D

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D

@export_file var image_filename: String

@export_category("Panorama Rotation")
@export_range(0, 360, 0.01, "degrees") var rotation_x: float
@export_range(0, 360, 0.01, "degrees") var rotation_y: float
@export_range(0, 360, 0.01, "degrees") var rotation_z: float

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh_instance.mesh = preload ("res://addons/ateneo-virtual-reality-escape/teleportation-system/misc-resources/PanoramaSphereMeshBase.tres")
	
	print("Loaded " + image_filename)
	var image: Image = load(image_filename).get_image()
	image.flip_x()
	var texture_panorama = ImageTexture.create_from_image(image)
	((mesh_instance.mesh as SphereMesh).material as StandardMaterial3D).albedo_texture = texture_panorama
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
