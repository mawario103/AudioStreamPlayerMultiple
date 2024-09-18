tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("AudioStreamPlayerMultiple", "Node", preload("AudioStreamPlayerMultiple.gd"), preload("Icon_16.png"))

func _exit_tree():
	remove_custom_type("AudioStreamPlayerMultiple")
