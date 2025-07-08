extends Node3D

var xr_interface : XRInterface

func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR Initialized Successfully")
		
		get_viewport().use_xr = true
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		Engine.physics_ticks_per_second = 60


func _on_ois_collider_area_3d_body_entered(body: Variant) -> void:
	print("Collided with " + body.name)
