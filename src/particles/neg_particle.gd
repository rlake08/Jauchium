extends BaseParticle


func _on_hit_particle(particle: BaseParticle) -> void:
	if particle.charge == -1:
		var direction_to_particle = global_position.direction_to(particle.global_position)
		goal_direction = -direction_to_particle
