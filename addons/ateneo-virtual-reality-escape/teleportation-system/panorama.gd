@tool
class_name Panorama
extends Node3D

@export_file var image_filename: String

@export_category("Panorama Rotation")
@export_range(0, 360, 0.01, "degrees") var rotation_x: float
@export_range(0, 360, 0.01, "degrees") var rotation_y: float
@export_range(0, 360, 0.01, "degrees") var rotation_z: float
@export var update_mesh : bool = false

var mesh_instance := MeshInstance3D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh_instance.mesh = preload ("res://addons/ateneo-virtual-reality-escape/teleportation-system/misc-resources/PanoramaSphereMeshBase.tres")
	
	print("Loaded " + image_filename)
	var image: Image = load(image_filename).get_image()
	image.flip_x()
	var texture_panorama = ImageTexture.create_from_image(image)
	((mesh_instance.mesh as SphereMesh).material as StandardMaterial3D).albedo_texture = texture_panorama
	mesh_instance.scale = Vector3(10, 10, 10)
	
	add_child(mesh_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		if update_mesh:
			mesh_instance.rotation.x = deg_to_rad(rotation_x)
			mesh_instance.rotation.y = deg_to_rad(rotation_y)
			mesh_instance.rotation.z = deg_to_rad(rotation_z)
			print("Mesh updated.")
			update_mesh = false
