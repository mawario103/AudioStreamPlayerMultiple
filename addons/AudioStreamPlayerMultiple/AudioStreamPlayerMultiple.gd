extends Node

export(Array, AudioStream) var Audio = [AudioStream]
export(Array, float) var Volume = [0]
export(Array, float) var Pitch = [1]
export(Array, String) var Bus = ["Master"]

var audio_loaded = []

var duplicate_player_script = preload("res://addons/AudioStreamPlayerMultiple/DuplicatePlayer.gd")

var play_process = false

signal all_finished

func _physics_process(_delta):
	if self.get_child_count() == 0:
		if play_process == true:
			emit_signal("all_finished")
			play_process = false

func add_audio(audio : AudioStream, volume : float = 0, pitch : float = 1.0, bus : String = "Master"):
	if AudioServer.get_bus_index(bus) == -1:
		push_error("No audiobus \"" + bus + "\" was found.")
		return
	else:
		Audio.append(audio)
		Volume.append(volume)
		Pitch.append(pitch)
		Bus.append(bus)

func set_audio(audio : AudioStream, id : int, volume : float = 0, pitch : float = 1.0, bus : String = "Master"):
	if AudioServer.get_bus_index(bus) == -1:
		push_error("No audiobus \"" + bus + "\" was found.")
		return
	else:
		if id > Volume.size() - 1:
			push_error("ID" + str(id) + " volume is not set")
			return
		elif id > Pitch.size() - 1:
			push_error("ID" + str(id) + " pitch is not set")
			return
		elif id > Bus.size() - 1:
			push_error("ID" + str(id) + " bus is not set")
			return
		if AudioServer.get_bus_index(Bus[id]) == -1:
			push_error("No audiobus \"" + Bus[id] + "\" was found.")
			return
		Audio[id] = audio
		Volume[id] = volume
		Pitch[id] = pitch
		Bus[id] = bus

func get_audio():
	return Audio

func get_volume():
	return Volume

func get_pitch():
	return Pitch

func get_bus():
	return Bus

func play(id : int):
	var player = AudioStreamPlayer.new()
	if id > Audio.size() - 1:
		push_warning("No ID" + str(id) + " audio assigned")
	elif id < 0:
		push_error("ID must be greater than or equal to 0")
	else:
		if id > Volume.size() - 1:
			push_error("ID" + str(id) + " volume is not set")
			return
		elif id > Pitch.size() - 1:
			push_error("ID" + str(id) + " pitch is not set")
			return
		elif id > Bus.size() - 1:
			push_error("ID" + str(id) + " bus is not set")
			return
		if AudioServer.get_bus_index(Bus[id]) == -1:
			push_error("No audiobus \"" + Bus[id] + "\" was found.")
			return
		player.set_script(duplicate_player_script)
		player.stream = Audio[id]
		player.volume_db = Volume[id]
		player.pitch_scale = Pitch[id]
		player.bus = Bus[id]
		player.name = "DuplicatePlayer"
		self.add_child(player)
		play_process = true

func stop_all():
	for i in range(self.get_child_count()):
		self.get_child(i).queue_free()

func clear():
	Audio = [AudioStream]
	Volume = [0]
	Pitch = [1]
	Bus = ["Master"]
