extends Node


func _ready():
	if OS.get_name() == "Android" or OS.get_name() == "iOS":
		queue_free()
