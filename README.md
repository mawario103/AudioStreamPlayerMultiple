# AudioStreamPlayerMultiple
### Features in this custom node
###  - Multiple audio can be played on a single node
###  - The same audio can be played back in duplicate
###  - Functions can be used for detailed editing from within the code

# How to use
### After adding the AudioStreamPlayerMultiple node, there is an Array of export variables in the inspector,
### The contents of the Array are similar to the properties of AudioStreamPlayer.

### The index location corresponds to the ID, so every time you add one audio, fill in all four Arrays.

### /!\ To duplicate the sound, an AudioStreamPlayer is added as a child node to this node each time a sound is played,
### It is not recommended to use music or sounds that need to loop, as it is designed to be deleted after playback is finished.

# Functon

## play(id)
### Play sound unless properties for the specified ID are missing

## stop_all()
### Stops all audio currently playing

## add_audio(audio, volume, pitch, bus)
### Add a audio to the list

## set_audio(audio, id, volume, pitch, bus)
### If the specified ID is not empty, the list can be edited

## get_audio(), get_volume(), get_pitch(), get_bus()
### Returns the corresponding list

## clear()
### Restore the list to its original state
 
 
 
Sorry, this text has been translated from Japanese using a translator, and may be difficult to read.
