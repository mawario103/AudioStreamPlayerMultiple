extends AudioStreamPlayer

func _ready():
	self.connect("finished",self,"_remove")
	self.play()

func _remove():
	self.queue_free()
